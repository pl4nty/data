-- Threat: !InfrastructureShared
-- Name: bb78c3ead7ba
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
