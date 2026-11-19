-- Threat: !InfrastructureShared
-- Name: 2178f281ff4f
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
return mp.INFECTED
