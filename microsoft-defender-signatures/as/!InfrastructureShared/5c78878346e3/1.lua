-- Threat: !InfrastructureShared
-- Name: 5c78878346e3
-- Type: 21

if peattributes.x86_image and peattributes.isexe and peattributes.hasstandardentry then
  return mp.INFECTED
end
return mp.CLEAN
