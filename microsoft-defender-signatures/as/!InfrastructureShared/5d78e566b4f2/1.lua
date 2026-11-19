-- Threat: !InfrastructureShared
-- Name: 5d78e566b4f2
-- Type: 21

if peattributes.isexe and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
