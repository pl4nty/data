-- Threat: !InfrastructureShared
-- Name: 7e789897da83
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
