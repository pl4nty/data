-- Threat: !InfrastructureShared
-- Name: 18678a6ed9ce4
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
