-- Threat: !InfrastructureShared
-- Name: 135781da8dfcf
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
