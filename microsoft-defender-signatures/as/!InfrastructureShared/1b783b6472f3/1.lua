-- Threat: !InfrastructureShared
-- Name: 1b783b6472f3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
