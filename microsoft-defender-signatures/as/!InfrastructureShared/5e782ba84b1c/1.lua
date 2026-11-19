-- Threat: !InfrastructureShared
-- Name: 5e782ba84b1c
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
