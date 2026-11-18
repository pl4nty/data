-- Threat: !InfrastructureShared
-- Name: 4e78e6be3131
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.dynmem_APIcall then
  return mp.INFECTED
end
return mp.CLEAN
