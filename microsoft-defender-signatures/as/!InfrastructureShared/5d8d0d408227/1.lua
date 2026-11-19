-- Threat: !InfrastructureShared
-- Name: 5d8d0d408227
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Glims")
  return mp.INFECTED
end
return mp.LOWFI
