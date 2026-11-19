-- Threat: !InfrastructureShared
-- Name: 3a78877a2687
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
