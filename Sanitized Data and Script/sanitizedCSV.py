# import pandas
import pandas as pd

# read file
data = pd.read_csv('filebeat_log_full.csv')
df = pd.read_csv('packetbeat_log_full.csv', low_memory=False)

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
'host.os.platform','host.os.type','log.offset'],axis=1,inplace=True)

#remove duplicated rows
df.drop_duplicates(subset=None, keep="first", inplace=True)

# remove multiple columns
df.drop(['_id','_index','_score','agent.ephemeral_id',
'agent.hostname', 'agent.id', 'agent.name', 'agent.version',
'ecs.version', 'host.architecture', 'host.containerized',
'host.hostname','host.id','host.mac','host.name','host.os.codename',
'host.os.family', 'host.os.kernel','host.os.name','host.os.name.text',
'host.os.platform','host.os.type','bytes_in',
'bytes_out','destination.mac','destination.packets','event.action',
'event.category','event.dataset','event.duration','event.end',
'event.kind','event.start','flow.final','flow.id','network.bytes',
'network.community_id','source.bytes','source.mac','source.packets',
'type'],axis=1,inplace=True)

#remove unnamed columns
df.drop(df.columns[df.columns.str.contains('unnamed',case = False)],axis = 1, inplace = True)

#save file
data.to_csv("filebeat_log_sanitized.csv",index=False)
df.to_csv("packetbeat_log_sanitized.csv",index=False)

# display
print("Done")
