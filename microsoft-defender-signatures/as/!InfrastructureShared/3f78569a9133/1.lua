-- Threat: !InfrastructureShared
-- Name: 3f78569a9133
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
