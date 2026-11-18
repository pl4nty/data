-- Threat: !InfrastructureShared
-- Name: 908d9d600064
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:MacInformer.A")
  return mp.INFECTED
end
return mp.LOWFI
