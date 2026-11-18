-- Threat: !InfrastructureShared
-- Name: 9678bc9c9f4c
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.ismsil then
  return mp.CLEAN
end
return mp.INFECTED
