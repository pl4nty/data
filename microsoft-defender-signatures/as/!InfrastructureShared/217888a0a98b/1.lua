-- Threat: !InfrastructureShared
-- Name: 217888a0a98b
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
