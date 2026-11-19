-- Threat: !InfrastructureShared
-- Name: 477834f2e50b
-- Type: 21

if peattributes.amd64_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
