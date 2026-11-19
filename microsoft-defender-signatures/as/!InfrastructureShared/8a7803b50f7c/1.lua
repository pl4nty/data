-- Threat: !InfrastructureShared
-- Name: 8a7803b50f7c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
