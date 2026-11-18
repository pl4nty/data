-- Threat: !InfrastructureShared
-- Name: 447870ac9ebf
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
