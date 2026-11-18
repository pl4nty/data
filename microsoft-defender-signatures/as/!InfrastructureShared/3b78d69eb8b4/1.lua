-- Threat: !InfrastructureShared
-- Name: 3b78d69eb8b4
-- Type: 21

if peattributes.is_process then
  return mp.CLEAN
end
if peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
