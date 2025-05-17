-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspBase64EncodedA\1_luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 52428800 then
  return mp.CLEAN
end
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_3 = l_0_0 .. "/" .. l_0_1
if (string.find)(l_0_0, "/bin", 1, true) == 1 or (((string.find)(l_0_0, "/usr/", 1, true) == 1 and not (string.find)(l_0_0, "/usr/local/", 1, true) == 1) or (string.find)(l_0_0, "/applications/microsoft defender.app/", 1, true) == 1) then
  return mp.CLEAN
end
if l_0_2 then
  (MpCommon.BmTriggerSig)(l_0_2, "BM_DefenseEvasion_EmbeddedPayload", l_0_3)
end
return mp.INFECTED

