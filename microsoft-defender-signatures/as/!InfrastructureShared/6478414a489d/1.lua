-- Threat: !InfrastructureShared
-- Name: 6478414a489d
-- Type: 21

if peattributes.amd64_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
