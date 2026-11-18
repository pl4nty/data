-- Threat: !InfrastructureShared
-- Name: 5a78f0c71a8e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
