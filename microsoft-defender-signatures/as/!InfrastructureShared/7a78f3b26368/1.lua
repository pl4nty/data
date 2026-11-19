-- Threat: !InfrastructureShared
-- Name: 7a78f3b26368
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
