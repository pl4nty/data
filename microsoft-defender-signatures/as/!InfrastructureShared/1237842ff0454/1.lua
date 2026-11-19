-- Threat: !InfrastructureShared
-- Name: 1237842ff0454
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
