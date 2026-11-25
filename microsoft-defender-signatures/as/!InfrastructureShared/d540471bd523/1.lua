-- Threat: !InfrastructureShared
-- Name: d540471bd523
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
