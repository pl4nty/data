-- Threat: !InfrastructureShared
-- Name: !#Lua:SenseIRCretaeFileinTemp
-- Type: 12
-- Includes: BMLuaLib, TechniqueTracker
-- MpAttributes: RPF:TopLevelFile & MpOnOpenOrCloseRtpScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_1 == nil or l_0_1 == "" then
    return mp.CLEAN
  end
  l_0_1 = MpCommon.PathToWin32Path(l_0_1)
  if l_0_1 == nil or l_0_1 == "" then
    return mp.CLEAN
  end
  l_0_1 = string.lower(l_0_1)
  if not string.find(l_0_1, "\\windows\\temp\\", 1, true) then
    return mp.CLEAN
  end
  local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  local l_0_3 = {
    {
      "powershell.exe",
      "\\programdata\\microsoft\\windows defender advanced threat protection\\"
    },
    {
      "powershell.exe",
      "\\program files\\windows defender advanced threat protection\\"
    }
  }
  if checkParentCmdlineCaseInsensitive(l_0_2, l_0_3, 5) then
    return mp.INFECTED
  end
  local l_0_4 = "senseir.exe"
  local l_0_5, l_0_6 = checkParentProcessNameFromListByPPIDRecursive(l_0_2, l_0_4, 5)
  if l_0_5 and l_0_6 then
    return mp.INFECTED
  end
end
return mp.CLEAN
