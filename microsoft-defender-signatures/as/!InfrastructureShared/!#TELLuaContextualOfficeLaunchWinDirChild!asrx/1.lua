-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:ContextualOfficeLaunchWinDirChild!asrx
-- Type: 9
-- Includes: HipsLuaInfra

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) ~= true then
  return mp.CLEAN
end
if GetCtxOfficeProc() ~= "productivity2" then
  return mp.CLEAN
end
local l_0_0 = MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
l_0_0 = (l_0_0 == nil and "" or l_0_0):lower()
local l_0_1 = MpCommon.ExpandEnvironmentVariables("%windir%")
l_0_1 = (l_0_1 == nil and "" or l_0_1):lower()
if l_0_0 ~= l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
