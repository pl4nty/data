-- Threat: !InfrastructureShared
-- Name: 8178e6a6d4bb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
