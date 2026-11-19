-- Threat: !InfrastructureShared
-- Name: 51b30ee92938
-- Type: 21

local l_0_0 = 3
if bm.GetSignatureMatchDuration() > l_0_0 * 10000000 then
  return mp.CLEAN
end
return mp.INFECTED
