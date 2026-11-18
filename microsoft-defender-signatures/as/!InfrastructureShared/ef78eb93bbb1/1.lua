-- Threat: !InfrastructureShared
-- Name: ef78eb93bbb1
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
return mp.INFECTED
