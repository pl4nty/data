-- Threat: !InfrastructureShared
-- Name: 50781f96582b
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.ismsil then
  return mp.CLEAN
end
return mp.INFECTED
