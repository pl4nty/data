-- Threat: !InfrastructureShared
-- Name: df782c9a502d
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
