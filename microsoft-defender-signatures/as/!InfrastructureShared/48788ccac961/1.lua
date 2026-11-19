-- Threat: !InfrastructureShared
-- Name: 48788ccac961
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
