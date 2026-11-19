-- Threat: !InfrastructureShared
-- Name: 11540659053da
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
