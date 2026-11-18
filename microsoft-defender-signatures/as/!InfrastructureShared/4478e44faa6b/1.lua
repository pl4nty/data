-- Threat: !InfrastructureShared
-- Name: 4478e44faa6b
-- Type: 21

if peattributes.is_process then
  return mp.CLEAN
end
if peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
