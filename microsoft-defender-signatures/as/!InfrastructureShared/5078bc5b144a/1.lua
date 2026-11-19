-- Threat: !InfrastructureShared
-- Name: 5078bc5b144a
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 6 then
  return mp.INFECTED
end
if mp.getfilesize() < 409600 then
  return mp.INFECTED
end
return mp.CLEAN
