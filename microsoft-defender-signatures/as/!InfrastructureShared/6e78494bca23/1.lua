-- Threat: !InfrastructureShared
-- Name: 6e78494bca23
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
