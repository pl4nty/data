-- Threat: !InfrastructureShared
-- Name: 81789e5cc72d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
