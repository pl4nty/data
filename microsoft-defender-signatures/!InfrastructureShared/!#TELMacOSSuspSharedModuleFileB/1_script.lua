-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspSharedModuleFileB\1_luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 52428800 then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_2 = (mp.GetCertificateInfo)()
if (#l_0_2 < 1 or l_0_2 == nil) and ((string.find)(l_0_0, "/users/shared", 1, true) == 1 or (string.find)(l_0_0, "/var/folders/", 1, true) == 1 or (string.find)(l_0_0, "/library/metadata/", 1, true) == 1 or (string.find)(l_0_0, "/private/tmp/", 1, true) == 1 or (string.find)(l_0_0, "/tmp/", 1, true) == 1) then
  if l_0_1 then
    TrackPidAndTechnique(l_0_1, "T1129", "Execution_SharedModules")
  end
  return mp.INFECTED
end
return mp.CLEAN

