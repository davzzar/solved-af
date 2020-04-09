#! /bin/bash

if [ $(ps ax | grep run_tests | wc -l) -eq 2 ]; then
    TESTS_DIR=/home/davzzar/Bastion/_6CCS3PRJ-saf/tests
    TEST_DIR=$(ls --sort=time $TESTS_DIR | head -1)
    TEST_FILE=$(ls $TESTS_DIR/$TEST_DIR/*.csv | head -1)

    CURRENT_TASK=$(tail -1 $TEST_FILE | cut -d',' -f1)

    NUMBER_COMPLETED=$(grep $CURRENT_TASK $TEST_FILE | wc -l)
    TOTAL_PROBLEMS=$(ls /home/davzzar/Bastion/_6CCS3PRJ-saf/inputs/*.tgf | wc -l)

    MESSGAE="*Progress report:* _ ${CURRENT_TASK} _ ${NUMBER_COMPLETED} out of ${TOTAL_PROBLEMS} problems completed."

    echo $MESSGAE

    /opt/anaconda/bin/telegram-send --format markdown "$MESSGAE"
fi

