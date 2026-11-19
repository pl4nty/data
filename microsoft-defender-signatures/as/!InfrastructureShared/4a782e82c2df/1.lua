-- Threat: !InfrastructureShared
-- Name: 4a782e82c2df
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
