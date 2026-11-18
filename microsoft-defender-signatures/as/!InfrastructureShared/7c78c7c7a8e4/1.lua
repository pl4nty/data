-- Threat: !InfrastructureShared
-- Name: 7c78c7c7a8e4
-- Type: 21

if peattributes.isexe and peattributes.no_security and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
