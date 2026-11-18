-- Threat: !InfrastructureShared
-- Name: 3c7880577458
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
