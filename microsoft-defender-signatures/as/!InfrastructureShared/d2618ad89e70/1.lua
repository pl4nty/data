-- Threat: !InfrastructureShared
-- Name: d2618ad89e70
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
