# import pandas
import pandas as pd

# read file
data = pd.read_csv('T1595 _ Packetbeat _ raw _ Grp12.csv', low_memory=False)

# display
print("Modifying CSV Data\n")

#remove duplicated rows
data.drop_duplicates(subset=None, keep="first", inplace=True)

# remove multiple columns
data.drop(['_id','_index','_score','agent.ephemeral_id',
'agent.hostname', 'agent.id', 'agent.name', 'agent.version',
'ecs.version', 'host.architecture', 'host.containerized',
'host.hostname','host.id','host.mac','host.name','host.os.codename',
'host.os.family', 'host.os.kernel','host.os.name','host.os.name.text',
'host.os.platform','host.os.type','bytes_in', 'bytes_out', 
'event.category','event.dataset','event.duration','event.end',
'event.kind','event.start', 'network.bytes', 'network.community_id',
'source.bytes', 'type'],axis=1,inplace=True)

#remove unnamed columns
data.drop(data.columns[data.columns.str.contains('unnamed',case = False)],axis = 1, inplace = True)

#save file
data.to_csv('T1595 _ Packetbeat _ clean _ Grp12.csv',index=False)

# display
print("Done")
