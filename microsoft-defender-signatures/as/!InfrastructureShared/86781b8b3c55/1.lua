-- Threat: !InfrastructureShared
-- Name: 86781b8b3c55
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
