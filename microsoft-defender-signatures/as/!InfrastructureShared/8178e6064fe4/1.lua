-- Threat: !InfrastructureShared
-- Name: 8178e6064fe4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
