-- Threat: !InfrastructureShared
-- Name: 3f78261c2860
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
