-- Threat: !InfrastructureShared
-- Name: a67849cb048a
-- Type: 21

if peattributes.ismsil and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
