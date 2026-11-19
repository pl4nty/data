-- Threat: !InfrastructureShared
-- Name: d178f81e6346
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
