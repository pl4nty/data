-- Threat: !InfrastructureShared
-- Name: 89780e7cec79
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
