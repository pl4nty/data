-- Threat: !InfrastructureShared
-- Name: 42785c6b6c32
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
