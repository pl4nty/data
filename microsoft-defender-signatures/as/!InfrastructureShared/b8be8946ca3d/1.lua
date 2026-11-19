-- Threat: !InfrastructureShared
-- Name: b8be8946ca3d
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:SheriDroid.A")
  return mp.INFECTED
end
return mp.LOWFI
