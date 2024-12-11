# Verdi notes

Verdi shortcuts

## Code view

| Shortcut          | Description  | Manual                                       |
| ----------------- | ------------ | -------------------------------------------- |
| `Alt + Shift + D` | Go to Driver | Right click in a signal, **OneTrace/Driver** |
| `Alt + Shift + L` | Go to Load   | Right click in a signal, **OneTrace/Load**   |

## Code waveform view

| Shortcut | Description            | Manual                 |
| -------- | ---------------------- | ---------------------- |
| `G`      | Add signal to waveform | **Signal/Get Signals** |


## Dump signals

For more information read the `vcs_ucli_ug.pdf` page 106 

**3 Commands -> Signal Value and Memory Dump Specification Commands -> dump**

```plain
fsdbDumpfile "novas.fsdb"
fsdbDumpvars 0 top
```

```plain
dump [-file <filename>] [-type FSDB|EVCD|VPD] [-locking]

dump -add <list_of_nids> [-fid <fid>] [-depth <levels>]
[-aggregates] [-ports|-in|-out|-inout] [-filter=<filter string>] [-msv
on|off] [-i<N>|-iall] [-isub][-v<N>|-vall] [-va|-vai|-vav]

dump -close [<file_ID>]
dump -flush <fid> [-fid <fid>]
dump -autoflush <on | off> [-fid <fid>]
dump -interval <seconds> [-fid <fid>]
dump -interval_simTime <time> [-fid <fid>]
dump -deltaCycle <on | off> [-fid <fid>]
dump -switch [<newName>] [-fid <fid>]
dump -forceEvent <on | off> [-fid <fid>]
dump -filter [=<filter list>] [-fid <fid>]
dump -showfilter [-fid <fid>]
dump -power <on | off> [-fid <fid>]
dump -powerstate <on | off> [-fid <fid>]
dump -suppress_file <file_name>
dump -suppress_instance <list_of_instances>
dump -enable [-fid <fid>]
dump -disable [-fid <fid>]
dump -glitch <on|off> [-fid <fid>]
dump -opened
dump -msv[on|off]
```


dump -file novas.fsdb -type FSDB -msv on
dump -add top -depth 0 -fid FSDB0

