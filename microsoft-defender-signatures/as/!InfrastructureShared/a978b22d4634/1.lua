-- Threat: !InfrastructureShared
-- Name: a978b22d4634
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
