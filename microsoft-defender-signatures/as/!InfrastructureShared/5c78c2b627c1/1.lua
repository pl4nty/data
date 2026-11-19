-- Threat: !InfrastructureShared
-- Name: 5c78c2b627c1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
