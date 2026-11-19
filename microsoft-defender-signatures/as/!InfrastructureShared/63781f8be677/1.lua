-- Threat: !InfrastructureShared
-- Name: 63781f8be677
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
