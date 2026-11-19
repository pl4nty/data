-- Threat: !InfrastructureShared
-- Name: 6540170d9bb2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
