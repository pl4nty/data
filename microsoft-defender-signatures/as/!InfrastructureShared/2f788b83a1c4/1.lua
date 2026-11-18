-- Threat: !InfrastructureShared
-- Name: 2f788b83a1c4
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
