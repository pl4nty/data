-- Threat: !InfrastructureShared
-- Name: d54072a0d53a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
