-- Threat: !InfrastructureShared
-- Name: 8478cb4c0462
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
