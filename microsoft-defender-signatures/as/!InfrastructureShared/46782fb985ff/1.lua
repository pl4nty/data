-- Threat: !InfrastructureShared
-- Name: 46782fb985ff
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
