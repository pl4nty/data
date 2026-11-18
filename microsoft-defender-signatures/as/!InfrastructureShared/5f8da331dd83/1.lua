-- Threat: !InfrastructureShared
-- Name: 5f8da331dd83
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Genieo.C")
  return mp.INFECTED
end
return mp.LOWFI
