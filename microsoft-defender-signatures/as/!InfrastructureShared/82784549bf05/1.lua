-- Threat: !InfrastructureShared
-- Name: 82784549bf05
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
