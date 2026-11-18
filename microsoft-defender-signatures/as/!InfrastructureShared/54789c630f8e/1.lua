-- Threat: !InfrastructureShared
-- Name: 54789c630f8e
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
