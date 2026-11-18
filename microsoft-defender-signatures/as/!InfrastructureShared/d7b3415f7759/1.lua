-- Threat: !InfrastructureShared
-- Name: d7b3415f7759
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = GetRollingQueue("NewServiceCreated")
if l_0_0 and next(l_0_0) then
  bm.add_related_string("BYOD", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
