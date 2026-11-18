-- Threat: !InfrastructureShared
-- Name: 8d782d98c1cf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
