-- Threat: !InfrastructureShared
-- Name: 347843b16d7a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
