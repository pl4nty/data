-- Threat: !InfrastructureShared
-- Name: 64789313558f
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
