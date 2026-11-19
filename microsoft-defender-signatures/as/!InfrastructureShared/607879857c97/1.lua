-- Threat: !InfrastructureShared
-- Name: 607879857c97
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
