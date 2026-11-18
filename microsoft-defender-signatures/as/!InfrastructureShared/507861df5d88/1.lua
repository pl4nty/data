-- Threat: !InfrastructureShared
-- Name: 507861df5d88
-- Type: 21

if peattributes.no_security == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
