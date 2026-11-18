-- Threat: !InfrastructureShared
-- Name: 4e789d3504e1
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
