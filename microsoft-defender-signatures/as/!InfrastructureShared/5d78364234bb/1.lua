-- Threat: !InfrastructureShared
-- Name: 5d78364234bb
-- Type: 21

if peattributes.amd64_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
