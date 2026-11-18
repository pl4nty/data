-- Threat: !InfrastructureShared
-- Name: 55781f5d0437
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.no_exports then
  return mp.CLEAN
end
return mp.INFECTED
