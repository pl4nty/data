-- Threat: !InfrastructureShared
-- Name: 49789fb742d3
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
