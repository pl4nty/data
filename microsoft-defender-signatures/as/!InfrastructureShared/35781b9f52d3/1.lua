-- Threat: !InfrastructureShared
-- Name: 35781b9f52d3
-- Type: 21

if peattributes.x86_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
