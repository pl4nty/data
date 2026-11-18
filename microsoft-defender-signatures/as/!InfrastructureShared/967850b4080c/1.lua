-- Threat: !InfrastructureShared
-- Name: 967850b4080c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
