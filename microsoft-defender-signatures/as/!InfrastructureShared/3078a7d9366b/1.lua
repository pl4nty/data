-- Threat: !InfrastructureShared
-- Name: 3078a7d9366b
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
