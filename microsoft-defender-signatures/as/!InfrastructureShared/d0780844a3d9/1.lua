-- Threat: !InfrastructureShared
-- Name: d0780844a3d9
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 4 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("HSTR:Ardamax")
  return mp.LOWFI
end
return mp.CLEAN
