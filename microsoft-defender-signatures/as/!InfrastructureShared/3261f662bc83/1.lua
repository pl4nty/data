-- Threat: !InfrastructureShared
-- Name: 3261f662bc83
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
