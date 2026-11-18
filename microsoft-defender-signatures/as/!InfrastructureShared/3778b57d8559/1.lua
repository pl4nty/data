-- Threat: !InfrastructureShared
-- Name: 3778b57d8559
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
