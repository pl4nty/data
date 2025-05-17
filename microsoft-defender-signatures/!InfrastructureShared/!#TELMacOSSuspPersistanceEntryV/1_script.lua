-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspPersistanceEntryV\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_4 = l_0_1 .. "/" .. l_0_2
if (string.find)(l_0_1, "/system/library/launch", 1, true) ~= 1 and ((string.find)(l_0_1, "/library/launchagents", 1, true) or (string.find)(l_0_1, "/library/launchdemons", 1, true)) then
  local l_0_5 = "MAC_PERSIST_PROG_PATHS"
  local l_0_6 = l_0_2
  if IsKeyInRollingQueue(l_0_5, l_0_6) then
    local l_0_7 = GetRollingQueueKeyValues(l_0_5, l_0_6)
    if l_0_7 == nil then
      return mp.CLEAN
    end
    for l_0_11,l_0_12 in ipairs(l_0_7) do
      if (string.find)((string.lower)(tostring(l_0_12.value)), "/library", 1, true) or (string.find)((string.lower)(tostring(l_0_12.value)), "/applications", 1, true) then
        return mp.CLEAN
      else
        if l_0_3 then
          (MpCommon.BmTriggerSig)(l_0_3, "DefenseEvasion_Masquerading_TaskOrService", l_0_4)
          TrackPidAndTechnique(l_0_3, "T1036.004", "DefenseEvasion_Masquerading_TaskOrService")
        end
        return mp.INFECTED
      end
    end
  end
end
do
  l_0_5 = mp
  l_0_5 = l_0_5.CLEAN
  return l_0_5
end

