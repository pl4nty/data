-- Threat: !InfrastructureShared
-- Name: 5878da0a870c
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
