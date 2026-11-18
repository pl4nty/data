-- Threat: !InfrastructureShared
-- Name: 998dbc44b119
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:AMCleaner.Y")
  return mp.INFECTED
end
return mp.LOWFI
