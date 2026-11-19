-- Threat: !InfrastructureShared
-- Name: 11f78200b92a6
-- Type: 21

if peattributes.ismsil and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
