-- Threat: !InfrastructureShared
-- Name: 4f785730fdbb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
