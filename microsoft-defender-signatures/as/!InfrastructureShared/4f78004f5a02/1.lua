-- Threat: !InfrastructureShared
-- Name: 4f78004f5a02
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
