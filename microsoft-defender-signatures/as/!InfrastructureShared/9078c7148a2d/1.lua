-- Threat: !InfrastructureShared
-- Name: 9078c7148a2d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
