-- Threat: !InfrastructureShared
-- Name: 738d176e3ec8
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:EliteKeylogger.A!xp")
  return mp.INFECTED
end
return mp.LOWFI
