-- Threat: !InfrastructureShared
-- Name: 6578eaf8cb8e
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
