-- Threat: !InfrastructureShared
-- Name: bf78426f207e
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
