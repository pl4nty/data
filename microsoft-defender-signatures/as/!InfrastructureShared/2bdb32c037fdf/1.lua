-- Threat: !InfrastructureShared
-- Name: 2bdb32c037fdf
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
local l_0_1 = GetRollingQueueKeys("SusLampz")
if l_0_1 then
  local l_0_2, l_0_3 = pcall(bm.get_imagepath)
  if not l_0_2 or isnull(l_0_3) then
    return mp.INFECTED
  end
  l_0_0 = string.lower(l_0_3)
  bm.add_related_string("MALCIOUS PATH: ", l_0_0, bm.RelatedStringBMReport)
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
