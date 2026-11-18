-- Threat: !InfrastructureShared
-- Name: 6d8d153bdcbf
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:MacCleaner.C")
  return mp.INFECTED
end
return mp.LOWFI
