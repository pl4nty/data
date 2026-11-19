-- Threat: !InfrastructureShared
-- Name: 13c8d7a804c74
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:BackTrack.C")
  return mp.INFECTED
end
return mp.LOWFI
