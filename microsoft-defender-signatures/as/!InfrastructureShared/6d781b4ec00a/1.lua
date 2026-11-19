-- Threat: !InfrastructureShared
-- Name: 6d781b4ec00a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
