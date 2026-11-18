-- Threat: !InfrastructureShared
-- Name: 3b788636e0db
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
