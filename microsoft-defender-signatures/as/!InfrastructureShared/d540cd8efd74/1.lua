-- Threat: !InfrastructureShared
-- Name: d540cd8efd74
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
