-- Threat: !InfrastructureShared
-- Name: b2d78c0b9b34e
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
