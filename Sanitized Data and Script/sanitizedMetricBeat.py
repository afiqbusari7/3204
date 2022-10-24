# import pandas
import pandas as pd

# read file
data = pd.read_csv('metricbeat_log_full.csv')

# display
print("Modifying CSV Data\n")

#remove duplicated rows
data.drop_duplicates(subset=None, keep="first", inplace=True)

# keep multiple columns
newdata = data[['@timestamp',
    'agent.type',
    'event.dataset',
    'host.architecture',
    'host.ip',
    'host.os.kernel',
    'host.os.name',
    'host.os.version',
    'metricset.name',
    'process.args',
    'process.cpu.pct',
    'process.executable',
    'process.memory.pct',
    'process.name',
    'process.working_directory',
    'system.process.cmdline',
    'system.process.cpu.total.norm.pct',
    'system.process.cpu.total.pct',
    'system.process.cpu.total.value',
    'system.process.fd.limit.hard',
    'system.process.fd.limit.soft',
    'system.process.memory.rss.bytes',
    'system.process.memory.rss.pct',
    'system.process.memory.share',
    'system.process.memory.size',
    'user.name']]

#save file
newdata.to_csv("metric_log_sanitized.csv",index=False)

# display
print("Done")
