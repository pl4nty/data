-- Threat: !InfrastructureShared
-- Name: 6d78f3ecb7bf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
