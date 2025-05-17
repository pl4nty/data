-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspHiddenFileFolderX\1_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_0, "/bin", 1, true) == 1 or (((string.find)(l_0_0, "/usr/", 1, true) == 1 and not (string.find)(l_0_0, "/usr/local/", 1, true) == 1) or (string.find)(l_0_0, "/applications/microsoft defender.app/", 1, true) == 1) then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if ((string.find)(l_0_0, "/contents/resources", 1, true) or (string.find)(l_0_0, "/users/shared", 1, true) or (string.find)(l_0_0, "/library", 1, true)) and ((string.find)(l_0_1, ".", 1, true) == 1 or (string.find)(l_0_0, "/.", 1, true)) then
  if l_0_2 then
    TrackPidAndTechnique(l_0_2, "T1564.001", "DefenseEvasion_HiddenFilesandDirectories")
    ;
    (MpCommon.BmTriggerSig)(l_0_2, "BM_SuspMacHiddenFileFolder", l_0_0)
  end
  return mp.INFECTED
end
return mp.CLEAN

