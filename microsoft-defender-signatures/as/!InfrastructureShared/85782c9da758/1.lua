-- Threat: !InfrastructureShared
-- Name: 85782c9da758
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
