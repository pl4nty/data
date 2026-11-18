-- Threat: !InfrastructureShared
-- Name: 2e78008ccf52
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
