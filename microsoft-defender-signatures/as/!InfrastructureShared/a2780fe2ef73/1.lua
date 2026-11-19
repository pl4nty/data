-- Threat: !InfrastructureShared
-- Name: a2780fe2ef73
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
