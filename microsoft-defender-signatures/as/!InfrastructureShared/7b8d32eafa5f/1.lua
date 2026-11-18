-- Threat: !InfrastructureShared
-- Name: 7b8d32eafa5f
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:AMCleaner.I")
  return mp.INFECTED
end
return mp.LOWFI
