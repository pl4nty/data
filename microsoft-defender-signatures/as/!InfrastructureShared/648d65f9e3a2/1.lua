-- Threat: !InfrastructureShared
-- Name: 648d65f9e3a2
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Maconomi.A")
  return mp.INFECTED
end
return mp.LOWFI
