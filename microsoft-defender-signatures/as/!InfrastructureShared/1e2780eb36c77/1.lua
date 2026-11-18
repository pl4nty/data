-- Threat: !InfrastructureShared
-- Name: 1e2780eb36c77
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
