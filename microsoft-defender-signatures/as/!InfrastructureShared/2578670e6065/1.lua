-- Threat: !InfrastructureShared
-- Name: 2578670e6065
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
