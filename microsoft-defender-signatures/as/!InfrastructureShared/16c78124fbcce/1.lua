-- Threat: !InfrastructureShared
-- Name: 16c78124fbcce
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
