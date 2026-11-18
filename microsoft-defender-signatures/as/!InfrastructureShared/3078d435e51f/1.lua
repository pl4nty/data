-- Threat: !InfrastructureShared
-- Name: 3078d435e51f
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
