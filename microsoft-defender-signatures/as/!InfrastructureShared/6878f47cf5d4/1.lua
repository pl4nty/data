-- Threat: !InfrastructureShared
-- Name: 6878f47cf5d4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
