-- Threat: !InfrastructureShared
-- Name: 1e1781355f9b8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
