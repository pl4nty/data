-- Threat: !InfrastructureShared
-- Name: 608d013b8351
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:KidLogger.A")
  return mp.INFECTED
end
return mp.LOWFI
