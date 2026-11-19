-- Threat: !InfrastructureShared
-- Name: 5e78093480f9
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 4 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 2 then
  return mp.LOWFI
end
return mp.CLEAN
