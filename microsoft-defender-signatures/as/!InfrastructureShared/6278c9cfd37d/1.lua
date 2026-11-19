-- Threat: !InfrastructureShared
-- Name: 6278c9cfd37d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
