-- Threat: !InfrastructureShared
-- Name: 9d785ebd2d97
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
