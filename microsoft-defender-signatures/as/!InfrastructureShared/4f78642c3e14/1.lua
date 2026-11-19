-- Threat: !InfrastructureShared
-- Name: 4f78642c3e14
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
