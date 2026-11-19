-- Threat: !InfrastructureShared
-- Name: 2a0780839f835
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
