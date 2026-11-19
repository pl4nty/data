-- Threat: !InfrastructureShared
-- Name: 56789474d6f2
-- Type: 21

if peattributes.ismsil and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
