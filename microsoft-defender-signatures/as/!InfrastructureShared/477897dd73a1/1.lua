-- Threat: !InfrastructureShared
-- Name: 477897dd73a1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
