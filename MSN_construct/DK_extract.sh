#! /bin/bash

#export FREESURFER_HOME=/home/xiaotongzhang/Freesurfer1223/freesurfer
export SUBJECTS_DIR=/run/media/guanliyuan/Elements/Cam_CAN/test_struc/experiment/recon_out
#source $FREESURFER_HOME/SetUpFreeSurfer.sh

#biaozhunkongjiantoushedaogetikongjian
for subj in 110033	110037	110045	110056	110069	110087	110098	110101	110126	110174	110182	110187	110319	110411	110606	112141	120008	120049	120061	120065	120120	120123	120166	120182	120208	120218	120234	120264	120276	120286	120309	120313	120319	120347	120376	120409	120462	120469	120470	120550	120640	120727	120764	120795	120816	120987	121106	121111	121144	121158	121194	121200	121317	121397	121411	121428	121479	121685	121795	122172	122405	122620	210023	210051	210088	210124	210148	210172	210182	210250	210304	210314	210422	210519	210526	210617	210657	212153	220098	220107	220115	220132	220151	220198	220203	220223	220232	220234	220284	220323	220335	220352	220372	220394	220419	220506	220518	220519	220526	220535	220567	220610	220635	220697	220713	220806	220828	220843	220901	220920	220974	220999	221002	221031	221033	221038	221040	221054	221107	221209	221220	221244	221324	221336	221352	221373	221487	221511	221527	221565	221580	221585	221595	221648	221733	221740	221755	221775	221828	221886	221935	221954	221977	221980
do
   mri_surf2surf --hemi lh --srcsubject fsaverage --sval-annot  /run/media/guanliyuan/Elements/Cam_CAN/test_struc/experiment/DK_308_fsaverage/lh.500.aparc.annot --trgsubject $subj --trgsurfval $SUBJECTS_DIR/$subj/label/lh.500.aparc.annot

   mris_anatomical_stats -a $SUBJECTS_DIR/$subj/label/lh.500.aparc.annot -f /run/media/guanliyuan/Elements/Cam_CAN/test_struc/experiment/DK_out/left/${subj}_lh.txt -b $subj lh

mri_surf2surf --hemi rh --srcsubject fsaverage --sval-annot  /run/media/guanliyuan/Elements/Cam_CAN/test_struc/experiment/DK_308_fsaverage/rh.500.aparc.annot --trgsubject $subj --trgsurfval $SUBJECTS_DIR/$subj/label/rh.500.aparc.annot

   mris_anatomical_stats -a $SUBJECTS_DIR/$subj/label/rh.500.aparc.annot -f /run/media/guanliyuan/Elements/Cam_CAN/test_struc/experiment/DK_out/right/${subj}_rh.txt -b $subj rh
done
