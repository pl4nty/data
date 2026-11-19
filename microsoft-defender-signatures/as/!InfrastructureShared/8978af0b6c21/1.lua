-- Threat: !InfrastructureShared
-- Name: 8978af0b6c21
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
