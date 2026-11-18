-- Threat: !InfrastructureShared
-- Name: 15c78ce0edae6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
