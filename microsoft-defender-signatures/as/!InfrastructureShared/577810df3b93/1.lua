-- Threat: !InfrastructureShared
-- Name: 577810df3b93
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
