-- Threat: !InfrastructureShared
-- Name: !#Lua:OpenAfterDropBySystem
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_0 == nil then
    return mp.CLEAN
  end
  if l_0_0:sub(1, 8) == "\\device\\" then
    l_0_0 = MpCommon.PathToWin32Path(l_0_0)
  end
  if l_0_0 == nil then
    return mp.CLEAN
  end
  l_0_0 = string.lower(l_0_0)
  if IsKeyInRollingQueue("SuspExeFileDroppedViaSMB", l_0_0, true) then
    return mp.INFECTED
  end
  if IsKeyInRollingQueue("SuspFileDroppedViaSMB", l_0_0, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
