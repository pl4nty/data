-- Threat: !InfrastructureShared
-- Name: 16540c82dc810
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
