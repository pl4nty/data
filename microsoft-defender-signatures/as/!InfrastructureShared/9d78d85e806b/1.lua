-- Threat: !InfrastructureShared
-- Name: 9d78d85e806b
-- Type: 21

if peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.ismsil then
  return mp.CLEAN
end
return mp.INFECTED
