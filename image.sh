#!/bin/bash
echo
RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'
echo -e "${RED}Welcome to the image compile script!"
echo -e "Check ${NC}README.md ${RED}or ${NC}PLi-metas.md ${RED}and enter a meta or a specific machine to compile."
echo -e "Answers are in ${GREEN}green:${NC}"
echo
echo -e "${GREEN}Atemio${NC} - ${GREEN}Cuberevo${NC} - ${GREEN}Fortis${NC} - ${GREEN}Fulan${NC} - ${GREEN}IPbox${NC} - ${GREEN}Kathrein${NC} - ${GREEN}SH4-misc${NC}"
echo
echo -e "${GREEN}ALL${RED}: Compiles all brands/models, As this requires huge free space this is not recommended!"
echo
echo -e "${GREEN}Specific${RED}: You have a specific machine in mind, Check ${NC}README ${RED}"
echo
echo -e "${RED}Enter the meta name:${NC}"
echo -e "${GREEN}"
read META
echo -e "${NC}"
if [ $META != "Atemio" -a $META != "Cuberevo" -a $META != "Fortis" -a $META != "Fulan" -a $META != "IPbox" -a $META != "Kathrein" -a $META != "SH4-misc" -a $META != "ALL" -a $META != "Specific" ]
then
	echo -e "${RED}Not a valid answer!${NC}"
	echo -e ""
	exit 0
fi
echo -e "${RED}Now choose whether you want to compile the image or the online feeds."
echo -e "Answers are in ${GREEN}green:${NC}"
echo
echo -e "${GREEN}Image${NC} - ${GREEN}Feed${NC}"
echo
echo -e "${RED}Enter image type:${NC}"
echo -e "${GREEN}"
read IMAGETYPE
echo -e "${NC}"
if [ "$IMAGETYPE" != "Image" -a $IMAGETYPE != "Feed" ]; then
	echo -e "${RED}Not a valid answer!${NC}"
	echo
	exit 0
fi
echo -e "${RED}First update everything, please wait...${NC}"
#/bin/sh update.sh
echo -e ""
echo -e "${RED}Updated.${NC}"
echo -e ""
echo -e "${RED}Compiling${GREEN} $META ${RED}images, please wait...${NC}"
echo -e ""
if [ "$IMAGETYPE" == "Image" ]; then
	IMAGECMD="make image"
fi
if [ "$IMAGETYPE" == "Feed" ]; then
	IMAGECMD="make feed"
fi
if [ "$META" == "Specific" ]; then
	echo -e "${RED}Enter your specific machine name exactly like what you see in ${NC}README"
	echo -e "${GREEN}"
	read MACHINESPECIFIC
	echo -e "${NC}"
	echo -e "${RED}Compiling${GREEN} $MACHINESPECIFIC ${RED}image, please wait ...${NC}"
	echo -e ""
	MACHINE=$MACHINESPECIFIC $IMAGECMD
fi
if [ "$META" == "Atemio" ]; then
	MACHINE=atemio520 $IMAGECMD
	MACHINE=atemio530 $IMAGECMD
fi
if [ "$META" == "Cuberevo" ]; then
	MACHINE=cuberevo $IMAGECMD
	MACHINE=cuberevo_250hd $IMAGECMD
	MACHINE=cuberevo_2000hd $IMAGECMD
	MACHINE=cuberevo_3000hd $IMAGECMD
	MACHINE=cuberevo_250hd $IMAGECMD
	MACHINE=cuberevo_mini $IMAGECMD
	MACHINE=cuberevo_mini2 $IMAGECMD
fi
if [ "$META" == "Fortis" ]; then
	MACHINE=atevio7500 $IMAGECMD
	MACHINE=fortis_hdbox $IMAGECMD
	MACHINE=hs7110 $IMAGECMD
	MACHINE=hs7420 $IMAGECMD
	MACHINE=hs7810a $IMAGECMD
	MACHINE=hs7119 $IMAGECMD
	MACHINE=hs7429 $IMAGECMD
	MACHINE=hs7819 $IMAGECMD
	MACHINE=octagon1008 $IMAGECMD
fi
if [ "$META" == "Fulan" ]; then
	MACHINE=spark $IMAGECMD
	MACHINE=spark7162 $IMAGECMD
fi
if [ "$META" == "IPbox" ]; then
	MACHINE=ipbox55 $IMAGECMD
	MACHINE=ipbox99 $IMAGECMD
	MACHINE=ipbox9900 $IMAGECMD
fi
if [ "$META" == "Kathrein" ]; then
	MACHINE=ufc960 $IMAGECMD
	MACHINE=ufs910 $IMAGECMD
	MACHINE=ufs912 $IMAGECMD
	MACHINE=ufs913 $IMAGECMD
	MACHINE=ufs922 $IMAGECMD
fi
if [ "$META" == "SH4-misc" ]; then
	MACHINE=adb_box $IMAGECMD
	MACHINE=arivalink200 $IMAGECMD
	MACHINE=hl101 $IMAGECMD
	MACHINE=pace7241 $IMAGECMD
	MACHINE=sagemcom88 $IMAGECMD
	MACHINE=tf7700 $IMAGECMD
	MACHINE=vip1_v2 $IMAGECMD
	MACHINE=vip2_v1 $IMAGECMD
	MACHINE=vitamin_hd5000 $IMAGECMD
fi
if [ "$META" == "ALL" ]; then
	MACHINE=adb_box $IMAGECMD
	MACHINE=arivalink200 $IMAGECMD
	MACHINE=atemio520 $IMAGECMD
	MACHINE=atemio530 $IMAGECMD
	MACHINE=atevio7500 $IMAGECMD
	MACHINE=cuberevo $IMAGECMD
	MACHINE=cuberevo_2000hd $IMAGECMD
	MACHINE=cuberevo_250hd $IMAGECMD
	MACHINE=cuberevo_3000hd $IMAGECMD
	MACHINE=cuberevo_9500hd $IMAGECMD
	MACHINE=cuberevo_mini $IMAGECMD
	MACHINE=cuberevo_mini2 $IMAGECMD
	MACHINE=fortis_hdbox $IMAGECMD
	MACHINE=hl101 $IMAGECMD
	MACHINE=hs7110 $IMAGECMD
	MACHINE=hs7119 $IMAGECMD
	MACHINE=hs7420 $IMAGECMD
	MACHINE=hs7429 $IMAGECMD
	MACHINE=hs7810a $IMAGECMD
	MACHINE=hs7819 $IMAGECMD
	MACHINE=ipbox55 $IMAGECMD
	MACHINE=ipbox99 $IMAGECMD
	MACHINE=ipbox9900 $IMAGECMD
	MACHINE=octagon1008 $IMAGECMD
	MACHINE=pace7241 $IMAGECMD
	MACHINE=sagemcom88 $IMAGECMD
	MACHINE=spark $IMAGECMD
	MACHINE=spark7162 $IMAGECMD
	MACHINE=tf7700 $IMAGECMD
	MACHINE=ufc960 $IMAGECMD
	MACHINE=ufs910 $IMAGECMD
	MACHINE=ufs912 $IMAGECMD
	MACHINE=ufs913 $IMAGECMD
	MACHINE=ufs922 $IMAGECMD
	MACHINE=vip1_v2 $IMAGECMD
	MACHINE=vip2_v1 $IMAGECMD
	MACHINE=vitamin_hd5000 $IMAGECMD
fi
echo -e ""
echo -e "${RED}Done, the compiled image is in ${NC}build/tmp/deploy/images/${GREEN}$MACHINE$MACHINESPECIFIC ${RED}folder!"
echo -e "It's a zipped file like ${NC}audioniek-enigma2-develop-7.0-rx-${GREEN}$MACHINE$MACHINESPECIFIC${NC}.zip"

