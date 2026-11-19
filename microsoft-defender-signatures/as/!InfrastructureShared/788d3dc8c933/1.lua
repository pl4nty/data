-- Threat: !InfrastructureShared
-- Name: 788d3dc8c933
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:BackTrack")
  return mp.INFECTED
end
return mp.LOWFI
