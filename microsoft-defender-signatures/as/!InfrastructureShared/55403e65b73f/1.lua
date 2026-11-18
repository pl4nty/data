-- Threat: !InfrastructureShared
-- Name: 55403e65b73f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
