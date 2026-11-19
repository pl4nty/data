-- Threat: !InfrastructureShared
-- Name: 547841b0ba37
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
