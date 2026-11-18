-- Threat: !InfrastructureShared
-- Name: 73781d17f5fe
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
