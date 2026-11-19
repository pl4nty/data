-- Threat: !InfrastructureShared
-- Name: 43788103b4f1
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
