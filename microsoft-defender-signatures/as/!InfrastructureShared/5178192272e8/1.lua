-- Threat: !InfrastructureShared
-- Name: 5178192272e8
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
