-- Threat: !InfrastructureShared
-- Name: a88dea5e6dc5
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:MacBooster.P")
  return mp.INFECTED
end
return mp.LOWFI
