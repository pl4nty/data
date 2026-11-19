-- Threat: !InfrastructureShared
-- Name: 3f78f030e3e7
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
