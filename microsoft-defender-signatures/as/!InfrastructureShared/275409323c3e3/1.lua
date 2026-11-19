-- Threat: !InfrastructureShared
-- Name: 275409323c3e3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
