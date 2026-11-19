-- Threat: !InfrastructureShared
-- Name: 12e78b749b355
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
