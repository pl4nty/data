-- Threat: !InfrastructureShared
-- Name: a28d3717cb0a
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:EliteKeylogger.B")
  return mp.INFECTED
end
return mp.LOWFI
