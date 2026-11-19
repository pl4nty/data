-- Threat: !InfrastructureShared
-- Name: 151781691205a
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.executes_from_dynamic_memory then
  return mp.CLEAN
end
return mp.INFECTED
