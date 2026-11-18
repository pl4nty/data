-- Threat: !InfrastructureShared
-- Name: 29781b97861f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
