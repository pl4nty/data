-- Threat: !InfrastructureShared
-- Name: 6878874f63d5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
