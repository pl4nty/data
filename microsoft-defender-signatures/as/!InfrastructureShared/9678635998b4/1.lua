-- Threat: !InfrastructureShared
-- Name: 9678635998b4
-- Type: 21

if peattributes.no_security == true and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
