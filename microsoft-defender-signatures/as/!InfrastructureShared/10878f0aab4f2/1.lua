-- Threat: !InfrastructureShared
-- Name: 10878f0aab4f2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
