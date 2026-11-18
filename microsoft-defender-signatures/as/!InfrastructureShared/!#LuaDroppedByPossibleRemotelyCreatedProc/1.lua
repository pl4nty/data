-- Threat: !InfrastructureShared
-- Name: !#Lua:DroppedByPossibleRemotelyCreatedProc
-- Type: 12
-- Includes: TechniqueTracker, LuaFuncHelper
-- MpAttributes: Lua:NewFileContextDataPresent

local l_0_0 = GetTacticsTableForPid("RTP")
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = false
if l_0_0.wmi_childproc then
  mp.set_mpattribute("Lua:DroppedByWmiChildProc")
  l_0_1 = true
elseif l_0_0.wsmprovhost_childproc then
  mp.set_mpattribute("Lua:DroppedByWSMChildProc")
  l_0_1 = true
elseif l_0_0.winrshost_childproc then
  mp.set_mpattribute("Lua:DroppedByWinrsChildProc")
  l_0_1 = true
elseif l_0_0.ExecRemoteDroppedExe then
  mp.set_mpattribute("Lua:DroppedByRemoteDropExeChildProc")
  l_0_1 = true
end
if l_0_1 then
  local l_0_2 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  if l_0_2:sub(1, 8) == "\\device\\" then
    l_0_2 = MpCommon.PathToWin32Path(l_0_2)
  end
  l_0_2 = string.lower(l_0_2)
  AppendToRollingQueue("DroppedByPossibleRemotelyCreatedProc", l_0_2, nil, 5000)
  return mp.INFECTED
end
return mp.CLEAN
