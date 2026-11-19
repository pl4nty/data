-- Threat: !InfrastructureShared
-- Name: c978d427b8e9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
