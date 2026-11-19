-- Threat: !InfrastructureShared
-- Name: 1617861ac8fec
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
