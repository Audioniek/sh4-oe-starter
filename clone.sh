#!/bin/bash

REPONAME=$1

if [ "$REPONAME"  == "" ]; then
    read -p "Where should your build environment reside? (default: ~/sh4-oe): "
    REPONAME=$REPLY
    if [ "$REPONAME" == "" ]; then
        REPONAME="~/sh4-oe"
    fi
fi

SCRIPTPATH="$(cd "$(dirname "$0")"; pwd -P)"

git config --global core.autocrlf input
echo "Cloning openpli-oe-core"
git clone --progress --quiet --branch develop https://github.com/OpenPLi/openpli-oe-core $REPONAME
cd $REPONAME

echo "Removing non-SH4 submodules"
metas='meta-amiko meta-edision meta-gi meta-maxytec meta-miraclebox meta-octagon meta-qt5 meta-spycat meta-xpeedc meta-zgemma meta-axasuhd meta-formuler meta-gigablue meta-qviart meta-vuplus meta-xsarius.pli5 meta-gfutures meta-sab meta-xp meta-xtrend'
for i in $metas;
do
   git submodule --quiet deinit $i
   git rm --quiet -r $i
   find -maxdepth 1 -name "Makefile" -type f -exec sed -i "s!\/$i !!g" {} \;
   find -maxdepth 1 -name "Makefile" -type f -exec sed -i -e ':a;N;$!ba;s!\t\$(CURDIR)\\\n!!g' {} \;
done
sed -i -e 's!\t$(CURDIR)\/meta-qt5!!g' Makefile

make update

cd meta-openpli
rm -r recipes-webkit
rm -r recipes-qt
cd ..

echo "Adding SH4 submodules"
metas='meta-atemio meta-cuberevo meta-fortis meta-fulan meta-ipbox meta-kathrein meta-sh4 meta-sh4-misc'
for i in $metas;
do
   git submodule --quiet add https://github.com/Audioniek/$i.git
   sed -i -e "s!\t\$(CURDIR)\/meta-local!\t\$(CURDIR)\/$i XYZ\n\t\$(CURDIR)\/meta-local!g" Makefile
   sed -i -e 's!XYZ!\\!g' Makefile
done
sed -i -e 's!\t\$(CURDIR)\/meta-local \\!\t\$(CURDIR)\/meta-local!g' Makefile

rm README
echo "sh4-oe" > README.md
echo >> README.md
echo " To build an image for a particular receiver, open a terminal" >> README.md
echo " in the directory $REPONAME." >> README.md
echo >> README.md
echo "Enter the following command:" >> README.md
echo >> README.md
echo "MACHINE=<receivername> make image" >> README.md
echo >> README.md
echo  >> README.md
echo "To build the image and the feed enter:" >> README.md
echo >> README.md
echo "MACHINE=<receivername> make feed" >> README.md
echo >> README.md
echo "To update all submodules from the repositories, enter:" >> README.md
echo "make update - or - ./update.sh" >> README.md
echo >> README.md
echo "<receivername> can be:" >> README.md
echo  >> README.md
echo "adb_box" >> README.md
echo "arivalink200" >> README.md
echo "atemio520" >> README.md
echo "atemio530" >> README.md
echo "atevio7500" >> README.md
echo "cuberevo" >> README.md
echo "cuberevo_2000hd" >> README.md
echo "cuberevo_250hd" >> README.md
echo "cuberevo_3000hd" >> README.md
echo "cuberevo_9500hd" >> README.md
echo "cuberevo_mini" >> README.md
echo "cuberevo_mini2" >> README.md
echo "fortis_hdbox" >> README.md
echo "hl101" >> README.md
echo "hs7110" >> README.md
echo "hs7119" >> README.md
echo "hs7420" >> README.md
echo "hs7429" >> README.md
echo "hs7810a" >> README.md
echo "hs7819" >> README.md
echo "ipbox55" >> README.md
echo "ipbox99" >> README.md
echo "ipbox9900" >> README.md
echo "octagon1008" >> README.md
echo "pace7241" >> README.md
echo "sagemcom88" >> README.md
echo "spark" >> README.md
echo "spark7162" >> README.md
echo "tf7700" >> README.md
echo "ufc960" >> README.md
echo "ufs910" >> README.md
echo "ufs912" >> README.md
echo "ufs913" >> README.md
echo "ufs922" >> README.md
echo "vip1_v2" >> README.md
echo "vip2_v1" >> README.md
echo "vitamin_hd5000" >> README.md
echo "README.md" >> .gitignore

cp ${SCRIPTPATH}/image.sh .
echo "image.sh" >> .gitignore
cp ${SCRIPTPATH}/submodule.sh .
echo "submodule.sh" >> .gitignore
cp "${SCRIPTPATH}/prepare-for-oe.sh" .
echo "prepare-for-oe.sh" >> .gitignore
cp ${SCRIPTPATH}/update.sh .
echo "update.sh" >> .gitignore
echo -e "\nFINISHED - Your new repository $REPONAME is ready to use"

