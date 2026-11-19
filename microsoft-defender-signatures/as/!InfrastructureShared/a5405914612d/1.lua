-- Threat: !InfrastructureShared
-- Name: a5405914612d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
