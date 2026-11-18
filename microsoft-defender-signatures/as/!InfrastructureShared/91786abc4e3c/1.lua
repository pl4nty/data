-- Threat: !InfrastructureShared
-- Name: 91786abc4e3c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
