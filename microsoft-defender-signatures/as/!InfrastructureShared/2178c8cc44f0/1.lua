-- Threat: !InfrastructureShared
-- Name: 2178c8cc44f0
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.executes_from_dynamic_memory then
  return mp.INFECTED
end
return mp.CLEAN
