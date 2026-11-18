-- Threat: !InfrastructureShared
-- Name: d5400dad0a87
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
