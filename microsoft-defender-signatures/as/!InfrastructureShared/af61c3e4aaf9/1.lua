-- Threat: !InfrastructureShared
-- Name: af61c3e4aaf9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
