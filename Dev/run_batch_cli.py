import os, sys
from os import listdir
from os.path import isfile, join
from datetime import datetime

def make_path(r_path):  
    ack = 1
    try:
        root = os.path.dirname(__file__)
        rel_path = os.path.join("..", r_path)

        abs_path = os.path.join(root, rel_path)
        os.chdir(abs_path)
        ack = 0
    except Exception as details:
        print('problem to get to the path '+r_path+' (0001) : ' + str(details))
    return ack


def run_batch(target_dir):
    batch = [f for f in listdir(target_dir) if isfile(join(target_dir, f))]
    fullpaths = []
    count = 0

    while count < len(batch):
        fullpaths.append(target_dir + batch[count]) 
        count += 1

    # path to executable or script
    make_path('C:/Users/Public/Desktop/Release')

    count = 1
    for fpath in fullpaths:
        command = "FEAFAA.exe {}".format(fpath)
        print(str(count)+" of "+str(len(fullpaths)), command)
        os.system(command)
        count += 1
    

if __name__ == "__main__":
    start_time = datetime.now()
    # Example Format: "C:\\\\Users\\Username\\Desktop\\Test_XML_Input_files\\"
    target_dir = sys.argv[1]
    run_batch(target_dir)
    exec_time = datetime.now() - start_time
    print("Execution Time [H:M:S]:", str(exec_time))
