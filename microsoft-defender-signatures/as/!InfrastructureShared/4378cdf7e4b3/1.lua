-- Threat: !InfrastructureShared
-- Name: 4378cdf7e4b3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
