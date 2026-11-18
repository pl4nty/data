-- Threat: !InfrastructureShared
-- Name: 42785f2bf478
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
