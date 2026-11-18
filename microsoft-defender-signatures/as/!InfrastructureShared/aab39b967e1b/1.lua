-- Threat: !InfrastructureShared
-- Name: aab39b967e1b
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(MpCommon.PathToWin32Path(l_0_0))
  local l_0_1 = StringSplit(l_0_0, "\\")
  if 7 < #l_0_1 and checkFileLastWriteTime(l_0_0, 120) == false then
    return mp.INFECTED
  end
end
return mp.CLEAN
