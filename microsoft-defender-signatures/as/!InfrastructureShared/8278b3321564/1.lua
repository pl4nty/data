-- Threat: !InfrastructureShared
-- Name: 8278b3321564
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
