-- Threat: !InfrastructureShared
-- Name: 567828a0e5df
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
