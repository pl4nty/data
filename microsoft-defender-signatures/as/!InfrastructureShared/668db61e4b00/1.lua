-- Threat: !InfrastructureShared
-- Name: 668db61e4b00
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:KextLogger.B")
  return mp.INFECTED
end
return mp.LOWFI
