-- Threat: !InfrastructureShared
-- Name: 8178c35953d1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
