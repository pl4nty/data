-- Threat: !InfrastructureShared
-- Name: 6d8d8418f353
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:EliteKeylogger.C")
  return mp.INFECTED
end
return mp.LOWFI
