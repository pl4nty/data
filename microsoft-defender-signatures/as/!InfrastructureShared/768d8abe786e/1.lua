-- Threat: !InfrastructureShared
-- Name: 768d8abe786e
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:Sgminer")
  return mp.INFECTED
end
return mp.LOWFI
