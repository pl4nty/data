local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONOPEN
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSDEVICEPATH
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_FILEPATH
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
L3_1 = {}
L3_1["\\programdata\\microsoft\\diagnosis\\temp\\diagtrack_{.*\\processdumpaction902\\processdump_.*.dmp"] = ""
L3_1["\\users\\.*\\appdata\\local\\temp\\vmware.loucs\\vmwarednd\\.*\\lsass.exe_.*.dmp"] = ""
L3_1["\\staging.ssm\\files\\windows\\temp\\haxm\\xm_7fbc1d8.tmp"] = ""
L3_1["\\users\\.*\\appdata\\local\\temp\\cabviewer\\.*\\.*-processdump_.*.dmp"] = ""
L3_1["\\users\\.*\\appdata\\local\\temp\\lsass.exe.*.dmp"] = ""
L3_1["\\wer\\reportqueue\\aw.*\\agent.pluginhost.exe.*mini.dmp"] = ""
L3_1["lsass.exe.secure.wxhu.dmp.decrypt.dmp"] = ""
L3_1[":\\data\\dumps\\debuguser.*\\dumpuid.*_processdump_.*.dmp"] = ""
L3_1[":\\data\\dumps\\debuguser.*\\dumpuid.*.hdmp"] = ""
L3_1[":\\data\\dumps\\debuguser.*\\dumpuid.*lsass.exe.*.secure.wxhu.dmp.decrypt.dmp"] = ""
L3_1["lsass.exe.secure.wxtu.dmp.decrypt.dmp"] = ""
L3_1[":\\windows\\temp\\.*_processdump_.*.dmp"] = ""
L3_1[":\\windows\\temp\\.*_memory.hdmp"] = ""
L4_1 = {}
L4_1["\\programdata\\microsoft\\azurewatson\\.\\awdumpifeo.exe"] = ""
L4_1["\\windows\\system32\\werfault.exe"] = ""
L4_1["\\programdata\\microsoft\\azurewatson\\.\\procdump\\x..\\procdump.*.exe"] = ""
L4_1["\\windows\\system32\\svchost.exe"] = ""
L4_1["doubletake.exe"] = ""
L4_1["vmware.vmx.exe"] = ""
L4_1["cabviewer.exe"] = ""
L4_1[":\\data\\debuggers\\debuggers\\debuggers\\CDB.*amd64skdump.exe"] = ""
L4_1["werdbg.exe"] = ""
L4_1[":\\data\\debuggers\\debuggers\\debuggers\\cdb.*amd64skdump.exe"] = ""
L5_1 = 0
L6_1 = pairs
L7_1 = L3_1
L6_1, L7_1, L8_1 = L6_1(L7_1)
for L9_1, L10_1 in L6_1, L7_1, L8_1 do
  L12_1 = L2_1
  L11_1 = L2_1.match
  L13_1 = L9_1
  L11_1 = L11_1(L12_1, L13_1)
  if L11_1 ~= nil then
    L5_1 = 1
    break
  end
end
if L5_1 == 1 then
  L6_1 = pairs
  L7_1 = L4_1
  L6_1, L7_1, L8_1 = L6_1(L7_1)
  for L9_1, L10_1 in L6_1, L7_1, L8_1 do
    L12_1 = L1_1
    L11_1 = L1_1.match
    L13_1 = L9_1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 ~= nil then
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
  end
end
L7_1 = L1_1
L6_1 = L1_1.find
L8_1 = "haxm.exe"
L6_1 = L6_1(L7_1, L8_1)
if L6_1 ~= nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.getfilesize
L6_1 = L6_1()
if L6_1 < 30720000 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = ":\000\\\000W\000i\000n\000d\000o\000w\000s\000\\\000S\000y\000s\000t\000e\000m\0003\0002\000\\\000l\000s\000a\000s\000s\000.\000e\000x\000e\000"
L8_1 = ":\000\\\000W\000i\000n\000d\000o\000w\000s\000\\\000S\000y\000s\000t\000e\000m\0003\0002\000\\\000l\000s\000a\000s\000r\000v\000.\000d\000l\000l\000\000\000"
L9_1 = "lsass.pdb"
L10_1 = mp
L10_1 = L10_1.readprotection
L11_1 = false
L10_1(L11_1)
L10_1 = tostring
L11_1 = mp
L11_1 = L11_1.readfile
L12_1 = 0
L13_1 = 200000
L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L11_1(L12_1, L13_1)
L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
L11_1 = mp
L11_1 = L11_1.readprotection
L12_1 = true
L11_1(L12_1)
L12_1 = L10_1
L11_1 = L10_1.find
L13_1 = L7_1
L14_1 = 1
L15_1 = true
L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
if L11_1 ~= nil then
  L12_1 = L10_1
  L11_1 = L10_1.find
  L13_1 = L8_1
  L14_1 = 1
  L15_1 = true
  L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
  if L11_1 ~= nil then
    L12_1 = L10_1
    L11_1 = L10_1.find
    L13_1 = L9_1
    L14_1 = 1
    L15_1 = true
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    if L11_1 ~= nil then
      goto lbl_146
    end
  end
end
L11_1 = mp
L11_1 = L11_1.CLEAN
do return L11_1 end
::lbl_146::
L11_1 = mp
L11_1 = L11_1.GetParentProcInfo
L11_1 = L11_1()
if L11_1 ~= nil then
  L12_1 = L11_1.ppid
  if L12_1 ~= nil then
    L12_1 = TrackPidAndTechnique
    L13_1 = L11_1.ppid
    L14_1 = "T1003.001"
    L15_1 = "credentialdumping_concrete"
    L16_1 = 86400
    L12_1(L13_1, L14_1, L15_1, L16_1)
  end
end
L12_1 = mp
L12_1 = L12_1.get_contextdata
L13_1 = mp
L13_1 = L13_1.CONTEXT_DATA_PROCESS_ID
L12_1 = L12_1(L13_1)
if L12_1 == 4 then
  L12_1 = mp
  L12_1 = L12_1.get_contextdata
  L13_1 = mp
  L13_1 = L13_1.CONTEXT_DATA_REMOTE_SESSION_IP
  L12_1 = L12_1(L13_1)
  if L12_1 and L12_1 ~= "" then
    L13_1 = mp
    L13_1 = L13_1.changedetectionname
    L14_1 = 1256183792
    L13_1(L14_1)
    L13_1 = mp
    L13_1 = L13_1.INFECTED
    return L13_1
  end
end
L12_1 = mp
L12_1 = L12_1.INFECTED
return L12_1
