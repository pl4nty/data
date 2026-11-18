-- Threat: !InfrastructureShared
-- Name: 4378c0f70fe9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
