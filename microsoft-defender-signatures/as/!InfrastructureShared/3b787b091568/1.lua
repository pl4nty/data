-- Threat: !InfrastructureShared
-- Name: 3b787b091568
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
