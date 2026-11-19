-- Threat: !InfrastructureShared
-- Name: 4a78b14d9657
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
