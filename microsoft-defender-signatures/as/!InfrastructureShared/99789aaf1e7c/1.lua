-- Threat: !InfrastructureShared
-- Name: 99789aaf1e7c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
