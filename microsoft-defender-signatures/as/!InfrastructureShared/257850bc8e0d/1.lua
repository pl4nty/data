-- Threat: !InfrastructureShared
-- Name: 257850bc8e0d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
