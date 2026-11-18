-- Threat: !InfrastructureShared
-- Name: 507839a632d9
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
