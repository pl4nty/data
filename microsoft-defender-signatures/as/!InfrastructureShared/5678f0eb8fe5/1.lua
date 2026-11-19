-- Threat: !InfrastructureShared
-- Name: 5678f0eb8fe5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
