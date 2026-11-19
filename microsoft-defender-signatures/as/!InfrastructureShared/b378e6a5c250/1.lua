-- Threat: !InfrastructureShared
-- Name: b378e6a5c250
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
