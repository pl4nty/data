-- Threat: !InfrastructureShared
-- Name: 1254084ad187f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
