-- Threat: !InfrastructureShared
-- Name: 13e8da90eb4ef
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Glims.D")
  return mp.INFECTED
end
return mp.LOWFI
