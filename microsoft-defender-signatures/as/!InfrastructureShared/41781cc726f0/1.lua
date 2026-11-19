-- Threat: !InfrastructureShared
-- Name: 41781cc726f0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
