-- Threat: !InfrastructureShared
-- Name: 3978b8130bc5
-- Type: 21

if peattributes.amd64_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
