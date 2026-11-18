-- Threat: !InfrastructureShared
-- Name: 397868784918
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
