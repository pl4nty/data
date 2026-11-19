-- Threat: !InfrastructureShared
-- Name: b1786a53e9e0
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
return mp.INFECTED
