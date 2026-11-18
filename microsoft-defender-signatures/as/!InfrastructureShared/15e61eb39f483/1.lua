-- Threat: !InfrastructureShared
-- Name: 15e61eb39f483
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
