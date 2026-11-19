-- Threat: !InfrastructureShared
-- Name: 17ab3d1b422f8
-- Type: 21

local l_0_0 = 3000000000
if l_0_0 < bm.GetSignatureMatchDuration() then
  return mp.CLEAN
end
return mp.INFECTED
