-- Threat: !InfrastructureShared
-- Name: 5378491d5446
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
