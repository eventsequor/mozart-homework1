#!/bin/bash
# Autor: Eder Leandro Carbonero Baquero

echo "  ______    _              _____           _                                "
echo " |  ____|  | |            / ____|         | |                               "
echo " | |__   __| | ___ _ __  | |     __ _ _ __| |__   ___  _ __   ___ _ __ ___  "
echo " |  __| / _\` \|/ _ \ '__| | |    / _\` | '__\| '_ \ / _ \| '_ \ / _ \ '__/ _ \ "
echo " | |___| (_| |  __/ |    | |___| (_| | |  | |_) | (_) | | | |  __/ | | (_) |"
echo " |______\__,_|\___|_|     \_____\__,_|_|  |_.__/ \___/|_| |_ |\___|_|  \___/ "
echo "  ______ ______ ______ ______ ______ ______ ______ ______ ______ ______    " 
echo " |______|______|______|______|______|______|______|______|______|______|  "
echo " | |  | |                                       | |        "                 
echo " | |__| | ___  _ __ ___   _____      _____  _ __| | __    "                  
echo " |  __  |/ _ \| '_ \` _ \ / _ \ \ /\ / / _ \| '__| |/ /   "                   
echo " | |  | | (_) | | | | | |  __/\ V  V / (_) | |  |   <   "                    
echo " |_|  |_|\___/|_| |_| |_|\___| \_/\_/ \___/|_|  |_|\_\ "


echo "\nStarting execution...\n"
if [ -e Task1.ozf ]
then
    rm Task1.ozf
    echo "File Task1.ozf deleted"
fi
if [ -e Task1.ozf ]
then
    rm main.ozf
    echo "File main.ozf deleted"
fi

# Compile Task1
echo "Eder Leandro Carbonero Baquero"
echo "Compiling file Task1.oz ..."
ozc -c Task1.oz

# Compile Task 2 
echo "\nCompiling file Task1.oz ..."
ozc -c Task2.oz

# Run general program
ozc -c Main.oz
ozengine Main.ozf