-- Threat: !InfrastructureShared
-- Name: d540780bc262
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
