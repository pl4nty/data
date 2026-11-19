-- Threat: !InfrastructureShared
-- Name: b28d7d34ee3b
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Crossrider.B!xp")
  return mp.INFECTED
end
return mp.LOWFI
