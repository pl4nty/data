-- Threat: !InfrastructureShared
-- Name: 8e8d330e9460
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:KextLogger.C")
  return mp.INFECTED
end
return mp.LOWFI
