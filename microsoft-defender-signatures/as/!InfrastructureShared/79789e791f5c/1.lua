-- Threat: !InfrastructureShared
-- Name: 79789e791f5c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
