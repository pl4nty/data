-- Threat: !InfrastructureShared
-- Name: 187780e4f3f18
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
