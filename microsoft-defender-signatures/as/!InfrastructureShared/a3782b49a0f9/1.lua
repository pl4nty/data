-- Threat: !InfrastructureShared
-- Name: a3782b49a0f9
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
