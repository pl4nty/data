-- Threat: !InfrastructureShared
-- Name: 7761b5237a11
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
