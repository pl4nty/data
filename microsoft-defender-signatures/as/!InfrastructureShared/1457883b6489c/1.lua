-- Threat: !InfrastructureShared
-- Name: 1457883b6489c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
