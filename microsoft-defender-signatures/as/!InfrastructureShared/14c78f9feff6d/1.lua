-- Threat: !InfrastructureShared
-- Name: 14c78f9feff6d
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
