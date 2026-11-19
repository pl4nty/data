-- Threat: !InfrastructureShared
-- Name: 1117894cb8d0f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
