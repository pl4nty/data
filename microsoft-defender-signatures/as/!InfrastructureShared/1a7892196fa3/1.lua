-- Threat: !InfrastructureShared
-- Name: 1a7892196fa3
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
