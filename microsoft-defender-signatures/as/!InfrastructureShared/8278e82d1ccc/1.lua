-- Threat: !InfrastructureShared
-- Name: 8278e82d1ccc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
