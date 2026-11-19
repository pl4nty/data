-- Threat: !InfrastructureShared
-- Name: 3878154f7f93
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
