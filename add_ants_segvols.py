
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
    parser.add_argument('-j','--jmap',dest='jmap',required=False, help='Location of JSON mapping file for brain regions. This'
                                                                      'is available here: '
                        'https://github.com/dbkeator/ants_seg_to_nidm/blob/master/ants_seg_to_nidm/mapping_data/antsmap.json ')
    parser.add_argument('-f', '--f', dest='fslut',required=True, help='Freesurfer LUT used in labelmap value -> region lookups')

    args = parser.parse_args()

    with open(args.subj,'r') as f:
        for line in f:
            # set up command line for get brain volume data and adding it to existing NIDM file
            # first check if a NIDM file exists in the site location
            #strip training \n from line
            line=line.rstrip('\n')
            loc = line.find("sub")
            if not isfile(join(line[:loc-1],"nidm.ttl")):
                print("No existing NIDM-E file for site: %s" %line[:loc-1])
                print("Skipping subject: %s" %line[loc:])
                continue
            else:
                # set up command to add brain volumes from Amazon bucket
                # -f "https://fcp-indi.s3.amazonaws.com/data/Projects/ABIDE/Outputs/mindboggle_swf/mindboggle/ants_subjects/sub-0050002/antslabelstats.csv,
                # https://fcp-indi.s3.amazonaws.com/data/Projects/ABIDE/Outputs/mindboggle_swf/mindboggle/ants_subjects/sub-0050002/antsbrainvols.csv,
                # https://fcp-indi.s3.amazonaws.com/data/Projects/ABIDE/Outputs/mindboggle_swf/mindboggle/ants_subjects/sub-0050002/antsBrainSegmentation.nii.gz"

                base_url = "https://fcp-indi.s3.amazonaws.com/data/Projects/"
                if "abide" in line:
                    base_url = base_url + "ABIDE/"
                elif "adhd200" in line:
                    base_url = base_url + "ADHD200/"
                else:
                    print("Error, can't find dataset (abide | adhd200) in line: %s" %line)
                    print("Skipping...")
                    continue
                base_url = base_url + "Outputs/mindboggle_swf/mindboggle/ants_subjects/"

                cmd="antsegstats2nidm -f \"" + base_url + line[loc:] + "/antslabelstats.csv," + \
                    base_url + line[loc:] + "/antsbrainvols.csv," + \
                    base_url + line[loc:] + "/antsBrainSegmentation.nii.gz\" -subjid " + line[loc+4:] + \
                    " -fslut " + args.fslut

                if args.jmap:
                    cmd=cmd + " -jmap " + args.jmap

                cmd = cmd + " -n " + line[:loc] + "nidm.ttl -o " + line[:loc] + \
                    "nidm.ttl"

                # execute command
                print(cmd)
                # system(cmd)


if __name__ == "__main__":
    main()