-- Threat: !InfrastructureShared
-- Name: 14e781e7a23b6
-- Type: 21

if peattributes.ismsil and peattributes.x86_image and peattributes.executable_image then
  return mp.INFECTED
end
return mp.CLEAN
