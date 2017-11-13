./cmd.sh
./path.sh
#mfccdir=`pwd`/mfcc
set -e


local/myfisher_prepare_dict.sh #replace your dictionary with mySrcDIct and your trascriptions with allTrans.txt and run this script
utils/prepare_lang.sh --position-dependent-phones true data/local/dict "<unk>" data/local/lang data/lang
