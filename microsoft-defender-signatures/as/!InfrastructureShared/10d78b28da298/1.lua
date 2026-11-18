-- Threat: !InfrastructureShared
-- Name: 10d78b28da298
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
