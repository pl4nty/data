-- Threat: !InfrastructureShared
-- Name: 50784f26685c
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
return mp.INFECTED
