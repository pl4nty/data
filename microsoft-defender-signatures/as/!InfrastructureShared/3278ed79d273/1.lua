-- Threat: !InfrastructureShared
-- Name: 3278ed79d273
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
