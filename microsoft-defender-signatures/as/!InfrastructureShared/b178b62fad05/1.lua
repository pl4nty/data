-- Threat: !InfrastructureShared
-- Name: b178b62fad05
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
