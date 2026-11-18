-- Threat: !InfrastructureShared
-- Name: bb780ac912b8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
