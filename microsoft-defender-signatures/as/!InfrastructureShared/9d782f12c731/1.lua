-- Threat: !InfrastructureShared
-- Name: 9d782f12c731
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
