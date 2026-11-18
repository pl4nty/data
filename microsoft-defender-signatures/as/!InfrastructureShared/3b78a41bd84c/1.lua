-- Threat: !InfrastructureShared
-- Name: 3b78a41bd84c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
