-- Threat: !InfrastructureShared
-- Name: 2d7816c10c4c
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
