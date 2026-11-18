-- Threat: !InfrastructureShared
-- Name: 59781ef116f8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
