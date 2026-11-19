-- Threat: !InfrastructureShared
-- Name: 2078f778dd53
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
