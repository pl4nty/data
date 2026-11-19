-- Threat: !InfrastructureShared
-- Name: 1037819fc3af5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
