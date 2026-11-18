-- Threat: !InfrastructureShared
-- Name: a1785d1772de
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
