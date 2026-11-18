-- Threat: !InfrastructureShared
-- Name: 62780804ad9b
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
