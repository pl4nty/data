-- Threat: !InfrastructureShared
-- Name: 1678fe7c7fbd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
