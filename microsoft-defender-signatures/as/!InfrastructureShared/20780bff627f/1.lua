-- Threat: !InfrastructureShared
-- Name: 20780bff627f
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
