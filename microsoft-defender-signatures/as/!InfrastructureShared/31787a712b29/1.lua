-- Threat: !InfrastructureShared
-- Name: 31787a712b29
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
