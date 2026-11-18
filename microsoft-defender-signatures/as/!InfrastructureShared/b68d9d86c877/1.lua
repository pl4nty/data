-- Threat: !InfrastructureShared
-- Name: b68d9d86c877
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:AMCleaner.P")
  return mp.INFECTED
end
return mp.LOWFI
