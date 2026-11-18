-- Threat: !InfrastructureShared
-- Name: 5578cef41048
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
