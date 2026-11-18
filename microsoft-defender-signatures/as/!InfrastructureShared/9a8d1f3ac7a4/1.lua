-- Threat: !InfrastructureShared
-- Name: 9a8d1f3ac7a4
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Glims.H")
  return mp.INFECTED
end
return mp.LOWFI
