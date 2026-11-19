-- Threat: !InfrastructureShared
-- Name: 7d7840f2b90b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
