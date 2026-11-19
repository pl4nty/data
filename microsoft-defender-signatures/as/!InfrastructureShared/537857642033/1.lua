-- Threat: !InfrastructureShared
-- Name: 537857642033
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
