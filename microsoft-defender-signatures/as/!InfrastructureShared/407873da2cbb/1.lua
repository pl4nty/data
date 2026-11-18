-- Threat: !InfrastructureShared
-- Name: 407873da2cbb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
