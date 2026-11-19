-- Threat: !InfrastructureShared
-- Name: 5bb3dd9b3938
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
local l_0_1 = {"OFFICE", "SCRIPTENG"}
local l_0_2 = {min = 1, max = 5}
if QueryProcContext(l_0_1, l_0_2) then
  return mp.INFECTED
end
if l_0_0 then
  local l_0_3 = IsKeyInRollingQueue("SuspExeFileDroppedViaSMB", l_0_0, true)
  local l_0_4 = MpCommon.QueryPersistContext(l_0_0, "NewPECreatedNoCert")
  if l_0_3 or l_0_4 then
    return mp.INFECTED
  end
end
return mp.CLEAN
