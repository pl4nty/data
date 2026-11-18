-- Threat: !InfrastructureShared
-- Name: 6c78147f6c94
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
