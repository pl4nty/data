-- Threat: !InfrastructureShared
-- Name: 583b307b26330
-- Type: 21

local l_0_0 = 1800000000
if l_0_0 < bm.GetSignatureMatchDuration() then
  return mp.CLEAN
end
return mp.INFECTED
