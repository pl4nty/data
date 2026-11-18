-- Threat: !InfrastructureShared
-- Name: 6b78d8959441
-- Type: 21

if peattributes.x86_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
