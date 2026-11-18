-- Threat: !InfrastructureShared
-- Name: 648d5f5c7243
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Refog.G")
  return mp.INFECTED
end
return mp.LOWFI
