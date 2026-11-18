-- Threat: !InfrastructureShared
-- Name: 1d278c71d0d95
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
