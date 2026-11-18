-- Threat: !InfrastructureShared
-- Name: 97be1cec9f93
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:LuckyPatcher.A")
  return mp.INFECTED
end
return mp.LOWFI
