-- Threat: \xac!LsassDump.A
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: BM_MEMDUMP_FILE

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE and l_0_0 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH))
local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
local l_0_3 = {
  ["\\programdata\\microsoft\\diagnosis\\temp\\diagtrack_{.*\\processdumpaction902\\processdump_.*.dmp"] = "",
  ["\\users\\.*\\appdata\\local\\temp\\vmware.loucs\\vmwarednd\\.*\\lsass.exe_.*.dmp"] = "",
  ["\\staging.ssm\\files\\windows\\temp\\haxm\\xm_7fbc1d8.tmp"] = "",
  ["\\users\\.*\\appdata\\local\\temp\\cabviewer\\.*\\.*-processdump_.*.dmp"] = "",
  ["\\users\\.*\\appdata\\local\\temp\\lsass.exe.*.dmp"] = "",
  ["\\wer\\reportqueue\\aw.*\\agent.pluginhost.exe.*mini.dmp"] = "",
  ["lsass.exe.secure.wxhu.dmp.decrypt.dmp"] = "",
  [":\\data\\dumps\\debuguser.*\\dumpuid.*_processdump_.*.dmp"] = "",
  [":\\data\\dumps\\debuguser.*\\dumpuid.*.hdmp"] = "",
  [":\\data\\dumps\\debuguser.*\\dumpuid.*lsass.exe.*.secure.wxhu.dmp.decrypt.dmp"] = "",
  ["lsass.exe.secure.wxtu.dmp.decrypt.dmp"] = "",
  [":\\windows\\temp\\.*_processdump_.*.dmp"] = "",
  [":\\windows\\temp\\.*_memory.hdmp"] = ""
}
local l_0_4 = {
  ["\\programdata\\microsoft\\azurewatson\\.\\awdumpifeo.exe"] = "",
  ["\\windows\\system32\\werfault.exe"] = "",
  ["\\programdata\\microsoft\\azurewatson\\.\\procdump\\x..\\procdump.*.exe"] = "",
  ["\\windows\\system32\\svchost.exe"] = "",
  ["doubletake.exe"] = "",
  ["vmware.vmx.exe"] = "",
  ["cabviewer.exe"] = "",
  [":\\data\\debuggers\\debuggers\\debuggers\\CDB.*amd64skdump.exe"] = "",
  ["werdbg.exe"] = "",
  [":\\data\\debuggers\\debuggers\\debuggers\\cdb.*amd64skdump.exe"] = ""
}
local l_0_5 = 0
for l_0_6, l_0_7 in pairs(l_0_3) do
  if l_0_2:match(l_0_6) ~= nil then
    l_0_5 = 1
    break
  end
end
if l_0_5 == 1 then
  for l_0_8, l_0_9 in pairs(l_0_4) do
    if l_0_1:match(l_0_8) ~= nil then
      return mp.CLEAN
    end
  end
end
if l_0_1:find("haxm.exe") ~= nil then
  return mp.CLEAN
end
local l_0_10 = mp.getfilesize()
if l_0_10 < 30720000 then
  return mp.CLEAN
end
local l_0_11 = ":\000\\\000W\000i\000n\000d\000o\000w\000s\000\\\000S\000y\000s\000t\000e\000m\0003\0002\000\\\000l\000s\000a\000s\000s\000.\000e\000x\000e\000"
local l_0_12 = ":\000\\\000W\000i\000n\000d\000o\000w\000s\000\\\000S\000y\000s\000t\000e\000m\0003\0002\000\\\000l\000s\000a\000s\000r\000v\000.\000d\000l\000l\000\000\000"
local l_0_13 = "lsass.pdb"
mp.readprotection(false)
local l_0_14 = tostring(mp.readfile(0, 200000))
mp.readprotection(true)
if l_0_14:find(l_0_11, 1, true) == nil or l_0_14:find(l_0_12, 1, true) == nil or l_0_14:find(l_0_13, 1, true) == nil then
  return mp.CLEAN
end
local l_0_15 = mp.GetParentProcInfo()
if l_0_15 ~= nil and l_0_15.ppid ~= nil then
  TrackPidAndTechnique(l_0_15.ppid, "T1003.001", "credentialdumping_concrete", 86400)
end
if mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_ID) == 4 then
  local l_0_16 = mp.get_contextdata(mp.CONTEXT_DATA_REMOTE_SESSION_IP)
  if l_0_16 and l_0_16 ~= "" then
    mp.changedetectionname(1256183792)
    return mp.INFECTED
  end
end
return mp.INFECTED
