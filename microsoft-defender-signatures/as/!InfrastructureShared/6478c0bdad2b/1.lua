-- Threat: !InfrastructureShared
-- Name: 6478c0bdad2b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
