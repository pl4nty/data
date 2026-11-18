-- Threat: !InfrastructureShared
-- Name: 718d3af40807
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:EliteKeylogger.A")
  return mp.INFECTED
end
return mp.LOWFI
