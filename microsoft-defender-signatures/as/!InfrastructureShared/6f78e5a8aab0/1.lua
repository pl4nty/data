-- Threat: !InfrastructureShared
-- Name: 6f78e5a8aab0
-- Type: 21

if peattributes.no_security == true and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
