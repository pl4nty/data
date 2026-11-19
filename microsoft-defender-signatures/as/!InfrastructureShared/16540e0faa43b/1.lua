-- Threat: !InfrastructureShared
-- Name: 16540e0faa43b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
