-- Threat: !InfrastructureShared
-- Name: 1c540a3e00acc
-- Type: 21

if peattributes.isexe and peattributes.no_security and peattributes.x86_image and peattributes.dynmem_APIcall then
  return mp.INFECTED
end
return mp.CLEAN
