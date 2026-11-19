-- Threat: !InfrastructureShared
-- Name: a178cfc07d53
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
