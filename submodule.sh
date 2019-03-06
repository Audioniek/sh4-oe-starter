#!/bin/sh
echo ""
echo "This is only for Developers with push access"
echo ""
echo "Stage 1: git pull for new changes"
echo ""
cd meta-atemio
echo "Checking out meta-atemio master branch:"
git checkout master
git pull
echo -e "\n"
cd ..
cd meta-cuberevo
echo "Checking out meta-cuberevo master branch:"
git checkout master
git pull
echo -e "\n"
cd ..
cd meta-fortis
echo "Checking out meta-fortis master branch:"
git checkout master
git pull
echo -e "\n"
cd ..
cd meta-fulan
echo "Checking out meta-fulan master branch:"
git checkout develop
git pull
echo -e "\n"
cd ..
cd meta-ipbox
echo "Checking out meta-ipbox master branch:"
git checkout master
git pull
echo -e "\n"
cd ..
cd meta-kathrein
echo "Checking out meta-kathrein master branch:"
git checkout master
git pull
echo -e "\n"
cd ..
cd meta-local
echo "Checking out meta-local master branch:"
git checkout master
git pull
echo -e "\n"
cd ..
cd meta-openpli
echo "Checking out meta-openpli master branch:"
git checkout master
git pull
echo -e "\n"
cd ..
cd meta-sh4
echo "Checking out meta-sh4 master branch:"
git checkout master
git pull
echo -e "\n"
cd ..
cd meta-sh4-misc
echo "Checking out meta-sh4-misc master branch:"
git checkout master
git pull
echo -e "\n"
cd ..
echo "Stage 2: git add for new changes"
echo ""
git add meta-*
git commit --dry-run
read -p "The above changes will be committed and pushed, [A]bort [P]roceed: " choice
if [ "$choice" = "P" -o "$choice" = "p" ];then
	git commit -S -m "Update submodules"
	echo "Stage 3: git push for new changes"
	echo ""
	git push
	echo "Done: all git repositories got updated to their latest versions!"
	echo ""
else 
	exit 0
fi

