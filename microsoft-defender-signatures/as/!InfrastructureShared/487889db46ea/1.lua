-- Threat: !InfrastructureShared
-- Name: 487889db46ea
-- Type: 21

if peattributes.x86_image and peattributes.isexe and peattributes.hasstandardentry then
  return mp.INFECTED
end
return mp.CLEAN
