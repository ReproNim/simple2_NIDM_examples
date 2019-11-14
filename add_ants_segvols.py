
import argparse
from os.path import join,basename,splitext,isfile
from os import system



def main():

    parser = argparse.ArgumentParser(prog='add_ants_segvols.py',
                                     description='''This is essentially a helper script which takes a list of
                                     BIDS-formatted subject IDs with paths to the BIDS subject folders for abide
                                     and adhd200 datasets and downloads the ANTS-generated stats files
                                     from an Amazon S3 bucket and adds the brain volume data to existing NIDM-E files
                                     if the particular subject ID exists.  The NIDM-E files are expected to be
                                     in the site's directory in the BIDS dataset and called nidm.ttl (e.g. for
                                     ABIDE site SDSU: ./datasets.datalad.org/abide/RawDataBIDS/SDSU/nidm.ttl''',
                                     formatter_class=argparse.RawDescriptionHelpFormatter)

    parser.add_argument('-s','--subj',dest='subj',required=True, help='Text file containing 1 line per participant'
                                                                       'with relative paths to the location of the'
                                                                       'BIDS subject directory:'
                                                                       ''
                                                                       './datasets.datalad.org/abide/RawDataBIDS/SDSU/sub-0050197'
                                                                       './datasets.datalad.org/abide/RawDataBIDS/SDSU/sub-0050190'
                                                                       './datasets.datalad.org/abide/RawDataBIDS/SDSU/sub-0050199'
                                                                       '...')
    parser.add_argument('-new','--new', action='store_true', required=False, help="If flag set then new NIDM files will")
    parser.add_argument('-forcenidm','--forcenidm', action='store_true', required=False, help="If flag set then data will be"
                                        "added to existing NIDM file regardless if subject already exists.")

    args = parser.parse_args()
    new  = args.new

    with open(args.subj,'r') as f:
        for line in f:
            # set up command line for get brain volume data and adding it to existing NIDM file
            # first check if a NIDM file exists in the site location
            #strip training \n from line
            line=line.rstrip('\n')
            loc = line.find("sub")
            if not new:
                if not isfile(join(line[:loc-1],"nidm.ttl")):
                    print("No existing NIDM-E file for site: %s" %line[:loc-1])
                    print("Skipping subject: %s" %line[loc:])
                    continue
            else:
                #check if nidm.ttl file actually exists and if so use it otherwise create from scratch
                 if isfile(join(line[:loc-1],"nidm.ttl")):
                     new = False
            # set up command to add brain volumes from Amazon bucket
            # -f "https://fcp-indi.s3.amazonaws.com/data/Projects/ABIDE/Outputs/mindboggle_swf/mindboggle/ants_subjects/sub-0050002/antslabelstats.csv,
            # https://fcp-indi.s3.amazonaws.com/data/Projects/ABIDE/Outputs/mindboggle_swf/mindboggle/ants_subjects/sub-0050002/antsbrainvols.csv,
            # https://fcp-indi.s3.amazonaws.com/data/Projects/ABIDE/Outputs/mindboggle_swf/mindboggle/ants_subjects/sub-0050002/antsBrainSegmentation.nii.gz"

            base_url = "https://fcp-indi.s3.amazonaws.com/data/Projects/"
            #get dataset (abide or adhd200) from line
            if "abide" in line:
                cmd=cmd + "ABIDE/"
            elif "adhd200" in line:
                cmd=cmd + "ADHD200/"
            elif "corr" in line:
                cmd=cmd + "CORR/"
            else:
                print("Error, can't find dataset (abide | adhd200) in line: %s" %line)
                print("Skipping...")
                continue

            base_url = base_url + "Outputs/mindboggle_swf/mindboggle/ants_subjects/"

            cmd="antsegstats2nidm -f \"" + base_url + line[loc:] + "/antslabelstats.csv," + \
                    base_url + line[loc:] + "/antsbrainvols.csv," + \
                    base_url + line[loc:] + "/antsBrainSegmentation.nii.gz\" -subjid " + line[loc+4:] 

            if not new:
                cmd = cmd + " -n " + line[:loc] + "nidm.ttl -o " + line[:loc] + \
                    "nidm.ttl"
                if args.forcenidm is not False:
                    cmd = cmd + " -forcenidm "
            else:
                cmd = cmd + " -o " + join(line[:loc],"nidm.ttl")
                if args.forcenidm is not False:
                    cmd = cmd + " -forcenidm "

            # execute command
            print(cmd)
            system(cmd)


if __name__ == "__main__":
    main()
