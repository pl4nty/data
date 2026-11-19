-- Threat: !InfrastructureShared
-- Name: 59782d258c09
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
