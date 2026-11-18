-- Threat: !InfrastructureShared
-- Name: 8c78606590a0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
