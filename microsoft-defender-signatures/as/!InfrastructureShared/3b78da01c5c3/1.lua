-- Threat: !InfrastructureShared
-- Name: 3b78da01c5c3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
