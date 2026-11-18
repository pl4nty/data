-- Threat: !InfrastructureShared
-- Name: e28d92489775
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:BackTrack.B")
  return mp.INFECTED
end
return mp.LOWFI
