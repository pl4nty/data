-- Threat: !InfrastructureShared
-- Name: 5d788bb256c8
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
