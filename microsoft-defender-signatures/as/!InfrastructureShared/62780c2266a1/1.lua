-- Threat: !InfrastructureShared
-- Name: 62780c2266a1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
