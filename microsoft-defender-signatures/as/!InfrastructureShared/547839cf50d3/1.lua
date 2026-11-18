-- Threat: !InfrastructureShared
-- Name: 547839cf50d3
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
