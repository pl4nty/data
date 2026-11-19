-- Threat: !InfrastructureShared
-- Name: 8978afaf9ad2
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
