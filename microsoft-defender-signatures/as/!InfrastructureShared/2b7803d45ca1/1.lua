-- Threat: !InfrastructureShared
-- Name: 2b7803d45ca1
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
