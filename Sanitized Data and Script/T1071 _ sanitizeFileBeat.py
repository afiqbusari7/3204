# import pandas
import pandas as pd

# read file
data = pd.read_csv(r'D:\Documents\SIT Stuff\Y3T1\3204\Cleaning\T1071 _ Filebeat _ raw _ Grp12.csv')

# display
print("Modifying CSV Data\n")

#remove duplicated rows
data.drop_duplicates(subset=None, keep="first", inplace=True)

# remove multiple columns
data.drop(['_id','_index','_score','agent.ephemeral_id',
'agent.hostname', 'agent.id', 'agent.name', 'agent.version',
'ecs.version', 'host.architecture', 'host.containerized',
'host.hostname','host.mac','host.name','host.os.codename',
'host.os.family', 'host.os.kernel','host.os.name','host.os.name.text',
'host.os.platform','host.os.type','log.offset'],axis=1,inplace=True)

#remove unnamed columns
data.drop(data.columns[data.columns.str.contains('unnamed',case = False)],axis = 1, inplace = True)

#save file
data.to_csv(r'D:\Documents\SIT Stuff\Y3T1\3204\Cleaning\T1071 _ Filebeat _ clean _ Grp12.csv',index=False)

# display
print("Done")
