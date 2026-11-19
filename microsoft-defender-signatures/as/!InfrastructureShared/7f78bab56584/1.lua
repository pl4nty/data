-- Threat: !InfrastructureShared
-- Name: 7f78bab56584
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
