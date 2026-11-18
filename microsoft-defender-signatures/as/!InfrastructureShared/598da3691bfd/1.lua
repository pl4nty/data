-- Threat: !InfrastructureShared
-- Name: 598da3691bfd
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Crossrider.B")
  return mp.INFECTED
end
return mp.LOWFI
