-- Threat: !InfrastructureShared
-- Name: 86789f3471a0
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
