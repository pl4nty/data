-- Threat: !InfrastructureShared
-- Name: 36784d3679f9
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
