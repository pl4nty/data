-- Threat: !InfrastructureShared
-- Name: 9478af94e5ea
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
