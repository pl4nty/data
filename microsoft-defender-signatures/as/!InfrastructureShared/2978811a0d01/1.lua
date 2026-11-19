-- Threat: !InfrastructureShared
-- Name: 2978811a0d01
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
