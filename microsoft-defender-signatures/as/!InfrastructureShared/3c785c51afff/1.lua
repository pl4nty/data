-- Threat: !InfrastructureShared
-- Name: 3c785c51afff
-- Type: 21

if peattributes.isdll == true and peattributes.x86_image and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
