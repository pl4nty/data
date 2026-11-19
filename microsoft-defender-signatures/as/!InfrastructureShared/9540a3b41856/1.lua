-- Threat: !InfrastructureShared
-- Name: 9540a3b41856
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
