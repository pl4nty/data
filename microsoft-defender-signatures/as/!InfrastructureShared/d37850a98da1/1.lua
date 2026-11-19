-- Threat: !InfrastructureShared
-- Name: d37850a98da1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
