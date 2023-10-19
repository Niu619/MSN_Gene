#-*-coding:utf-8-*-
import os
import pandas as pd

def get_info(folder,fileName):
    
    area = {}
    volume = {}
    thickness = {}
    thicknessstd = {}
    meancurv = {}
    gauscurv = {}
    foldind = {}
    curvind = {}

    for filepath, dirname, filenames in os.walk(folder):
        for filename in filenames:
            with open(os.path.join(filepath, filename)) as f:
                for line in f:
                    line = line.strip()
                    if line.startswith('# subjectname'):
                        name = line.rsplit(' ', 1)[1]
                        area['subjectname'] = area.get('subjectname', []) + [name]
                        volume['subjectname'] = volume.get('subjectname', []) + [name]
                        thickness['subjectname'] = thickness.get('subjectname', []) + [name]
                        thicknessstd['subjectname'] = thicknessstd.get('subjectname', []) + [name]
                        meancurv['subjectname'] = meancurv.get('subjectname', []) + [name]
                        gauscurv['subjectname'] = gauscurv.get('subjectname', []) + [name]
                        foldind['subjectname'] = foldind.get('subjectname', []) + [name]
                        curvind['subjectname'] = curvind.get('subjectname', []) + [name]
                    #if line.startswith('7Networks_'):
                    if not line.startswith('#'):
                        if not line.startswith('unknown'):
                            line_list = line.split()

                            area[line_list[0]] = area.get(line_list[0], []) + [line_list[2]]
                            volume[line_list[0]] = volume.get(line_list[0], []) + [line_list[3]]
                            thickness[line_list[0]] = thickness.get(line_list[0], []) + [line_list[4]]
                            thicknessstd[line_list[0]] = thicknessstd.get(line_list[0], []) + [line_list[5]]
                            meancurv[line_list[0]] = meancurv.get(line_list[0], []) + [line_list[6]]
                            gauscurv[line_list[0]] = gauscurv.get(line_list[0], []) + [line_list[7]]
                            foldind[line_list[0]] = foldind.get(line_list[0], []) + [line_list[8]]
                            curvind[line_list[0]] = curvind.get(line_list[0], []) + [line_list[9]]

        df = pd.DataFrame(area)  
        df2 = pd.DataFrame(volume)
        df3 = pd.DataFrame(thickness)
        df4 = pd.DataFrame(thicknessstd)
        df5 = pd.DataFrame(meancurv)
        df6 = pd.DataFrame(gauscurv)
        df7 = pd.DataFrame(foldind)
        df8 = pd.DataFrame(curvind)

        
        #for k in df.keys():
            #df[k] = pd.to_numeric(df[k])
            #df2[k] = pd.to_numeric(df2[k])
            #df3[k] = pd.to_numeric(df3[k])
            #df4[k] = pd.to_numeric(df4[k])
            #df5[k] = pd.to_numeric(df5[k])
            #df6[k] = pd.to_numeric(df6[k])
            #df7[k] = pd.to_numeric(df7[k])
            #df8[k] = pd.to_numeric(df8[k])

        df.to_excel(fileName, index=False, sheet_name='area') 

        
        writer = pd.ExcelWriter(fileName, mode="a", engine="openpyxl")

        
        df2.to_excel(writer, index=False, sheet_name='volume')
        df3.to_excel(writer, index=False, sheet_name='thickness')
        df4.to_excel(writer, index=False, sheet_name='thicknessstd')
        df5.to_excel(writer, index=False, sheet_name='meancurv')
        df6.to_excel(writer, index=False, sheet_name='gauscurv')
        df7.to_excel(writer, index=False, sheet_name='foldind')
        df8.to_excel(writer, index=False, sheet_name='curvind')

        writer._save()


get_info('E:/01niujinpeng/graduate/ISFC/article_Second/gene-MSN/s/left','E:/01niujinpeng/graduate/ISFC/article_Second/gene-MSN/s/left_result.xlsx')
get_info('E:/01niujinpeng/graduate/ISFC/article_Second/gene-MSN/s/right','E:/01niujinpeng/graduate/ISFC/article_Second/gene-MSN/s/right_result.xlsx')