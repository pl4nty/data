-- Threat: !InfrastructureShared
-- Name: 4778a89b2029
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
