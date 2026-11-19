-- Threat: !InfrastructureShared
-- Name: 5b784f4c3924
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
