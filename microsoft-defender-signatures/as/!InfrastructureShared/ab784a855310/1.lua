-- Threat: !InfrastructureShared
-- Name: ab784a855310
-- Type: 21

if peattributes.amd64_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
