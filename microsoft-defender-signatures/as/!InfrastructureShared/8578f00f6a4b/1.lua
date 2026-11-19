-- Threat: !InfrastructureShared
-- Name: 8578f00f6a4b
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
