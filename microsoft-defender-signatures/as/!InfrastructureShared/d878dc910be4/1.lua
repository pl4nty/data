-- Threat: !InfrastructureShared
-- Name: d878dc910be4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
