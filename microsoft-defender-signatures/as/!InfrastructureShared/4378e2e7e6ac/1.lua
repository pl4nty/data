-- Threat: !InfrastructureShared
-- Name: 4378e2e7e6ac
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
