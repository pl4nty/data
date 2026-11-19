-- Threat: !InfrastructureShared
-- Name: 5c78465af46e
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.dynmem_APIcall then
  return mp.CLEAN
end
if not peattributes.dynmem_uses_access_violation and not peattributes.executes_from_dynamic_memory then
  return mp.CLEAN
end
return mp.INFECTED
