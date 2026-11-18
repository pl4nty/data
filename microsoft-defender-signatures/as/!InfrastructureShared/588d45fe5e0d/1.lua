-- Threat: !InfrastructureShared
-- Name: 588d45fe5e0d
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Glims.I")
  return mp.INFECTED
end
return mp.LOWFI
