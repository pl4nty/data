-- Threat: !InfrastructureShared
-- Name: 8478c72f769d
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
