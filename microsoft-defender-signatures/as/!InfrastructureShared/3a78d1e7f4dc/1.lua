-- Threat: !InfrastructureShared
-- Name: 3a78d1e7f4dc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
