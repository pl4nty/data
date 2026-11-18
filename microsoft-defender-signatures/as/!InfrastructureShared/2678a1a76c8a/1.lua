-- Threat: !InfrastructureShared
-- Name: 2678a1a76c8a
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
