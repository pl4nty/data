-- Threat: !InfrastructureShared
-- Name: 185405b22b249
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
