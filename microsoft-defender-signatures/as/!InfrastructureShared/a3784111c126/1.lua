-- Threat: !InfrastructureShared
-- Name: a3784111c126
-- Type: 21

if peattributes.ismsil and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
