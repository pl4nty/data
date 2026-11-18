-- Threat: !InfrastructureShared
-- Name: 9a78075e69c8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
