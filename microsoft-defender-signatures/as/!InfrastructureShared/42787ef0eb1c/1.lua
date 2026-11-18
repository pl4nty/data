-- Threat: !InfrastructureShared
-- Name: 42787ef0eb1c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
