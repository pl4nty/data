-- Threat: !InfrastructureShared
-- Name: 1e778b8cff6dc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
