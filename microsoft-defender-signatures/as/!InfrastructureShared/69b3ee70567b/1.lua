-- Threat: !InfrastructureShared
-- Name: 69b3ee70567b
-- Type: 21

if bm.GetSignatureMatchDuration() > 20000000 then
  return mp.CLEAN
end
if not this_sigattrlog[1].matched or this_sigattrlog[1].utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1].utf8p1
bm.trigger_sig("BMGenericCodeInjector.A", l_0_0)
return mp.CLEAN
