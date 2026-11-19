-- Threat: !InfrastructureShared
-- Name: 908dea7b1cea
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Genieo.I")
  return mp.INFECTED
end
return mp.LOWFI
