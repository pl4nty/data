-- Threat: !InfrastructureShared
-- Name: 46782a096c5e
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
