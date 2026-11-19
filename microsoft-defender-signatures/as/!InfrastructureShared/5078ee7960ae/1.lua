-- Threat: !InfrastructureShared
-- Name: 5078ee7960ae
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
