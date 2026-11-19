-- Threat: !InfrastructureShared
-- Name: 7c784dfa4bea
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
