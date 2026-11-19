-- Threat: !InfrastructureShared
-- Name: 477834541545
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
