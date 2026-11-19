-- Threat: !InfrastructureShared
-- Name: 63784296116e
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.dynmem_uses_access_violation then
  return mp.CLEAN
end
if not peattributes.dynmem_APIcall then
  return mp.CLEAN
end
return mp.INFECTED
