-- Threat: !InfrastructureShared
-- Name: 2e789585e1f9
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
