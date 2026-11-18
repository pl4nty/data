-- Threat: !InfrastructureShared
-- Name: 16540320d7fd4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
