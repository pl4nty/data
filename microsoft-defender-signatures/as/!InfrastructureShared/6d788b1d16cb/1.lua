-- Threat: !InfrastructureShared
-- Name: 6d788b1d16cb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
