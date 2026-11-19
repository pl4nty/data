-- Threat: !InfrastructureShared
-- Name: 4178f3654a04
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
