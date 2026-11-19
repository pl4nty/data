-- Threat: !InfrastructureShared
-- Name: 6c7851990578
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
