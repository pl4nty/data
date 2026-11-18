-- Threat: !InfrastructureShared
-- Name: 6878eb8ef174
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
