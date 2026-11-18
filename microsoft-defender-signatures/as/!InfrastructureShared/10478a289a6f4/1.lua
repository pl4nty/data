-- Threat: !InfrastructureShared
-- Name: 10478a289a6f4
-- Type: 21

if peattributes.isexe and peattributes.no_security == false and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
