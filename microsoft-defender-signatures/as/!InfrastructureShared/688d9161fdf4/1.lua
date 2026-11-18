-- Threat: !InfrastructureShared
-- Name: 688d9161fdf4
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:MacInformer.B")
  return mp.INFECTED
end
return mp.LOWFI
