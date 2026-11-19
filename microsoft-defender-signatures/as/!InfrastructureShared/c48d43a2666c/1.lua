-- Threat: !InfrastructureShared
-- Name: c48d43a2666c
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:MacCleaner.B")
  return mp.INFECTED
end
return mp.LOWFI
