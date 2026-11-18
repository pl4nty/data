-- Threat: !InfrastructureShared
-- Name: b478ae1ad607
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
