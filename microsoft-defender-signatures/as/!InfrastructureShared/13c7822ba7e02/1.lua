-- Threat: !InfrastructureShared
-- Name: 13c7822ba7e02
-- Type: 21

if peattributes.ismsil and peattributes.x86_image and peattributes.executable_image then
  return mp.INFECTED
end
return mp.CLEAN
