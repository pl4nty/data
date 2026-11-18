-- Threat: !InfrastructureShared
-- Name: 4078d3ba54fe
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
