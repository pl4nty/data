-- Threat: !InfrastructureShared
-- Name: ac61e8c157e7
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
