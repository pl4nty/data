-- Threat: !InfrastructureShared
-- Name: 938dc387f915
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:Pirrit.I")
  return mp.INFECTED
end
return mp.LOWFI
