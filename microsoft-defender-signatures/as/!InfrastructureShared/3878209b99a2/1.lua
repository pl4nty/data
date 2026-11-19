-- Threat: !InfrastructureShared
-- Name: 3878209b99a2
-- Type: 21

if peattributes.x86_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
