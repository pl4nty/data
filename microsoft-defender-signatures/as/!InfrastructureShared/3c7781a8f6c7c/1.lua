-- Threat: !InfrastructureShared
-- Name: 3c7781a8f6c7c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
