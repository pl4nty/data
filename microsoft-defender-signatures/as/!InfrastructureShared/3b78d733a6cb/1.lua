-- Threat: !InfrastructureShared
-- Name: 3b78d733a6cb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
