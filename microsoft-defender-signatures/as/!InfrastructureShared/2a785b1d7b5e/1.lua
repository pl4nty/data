-- Threat: !InfrastructureShared
-- Name: 2a785b1d7b5e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
