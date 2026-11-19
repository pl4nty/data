-- Threat: !InfrastructureShared
-- Name: 4c788b1118d1
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
