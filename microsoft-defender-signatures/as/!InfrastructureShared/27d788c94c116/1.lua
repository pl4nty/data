-- Threat: !InfrastructureShared
-- Name: 27d788c94c116
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
