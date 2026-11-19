-- Threat: !InfrastructureShared
-- Name: d37850ef36d1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
