-- Threat: !InfrastructureShared
-- Name: 2778da4e824e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
