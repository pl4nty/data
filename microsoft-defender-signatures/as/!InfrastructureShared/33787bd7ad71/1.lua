-- Threat: !InfrastructureShared
-- Name: 33787bd7ad71
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
