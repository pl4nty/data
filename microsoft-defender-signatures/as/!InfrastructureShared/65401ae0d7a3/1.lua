-- Threat: !InfrastructureShared
-- Name: 65401ae0d7a3
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
