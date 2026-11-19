-- Threat: !InfrastructureShared
-- Name: 38789df2ed6a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
