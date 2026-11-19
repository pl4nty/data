-- Threat: !InfrastructureShared
-- Name: 15278fec8a925
-- Type: 21

if peattributes.ismsil and peattributes.x86_image and peattributes.executable_image then
  return mp.INFECTED
end
return mp.CLEAN
