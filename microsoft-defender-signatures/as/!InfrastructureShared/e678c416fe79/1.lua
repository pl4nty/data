-- Threat: !InfrastructureShared
-- Name: e678c416fe79
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
