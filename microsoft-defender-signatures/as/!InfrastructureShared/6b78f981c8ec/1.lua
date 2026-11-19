-- Threat: !InfrastructureShared
-- Name: 6b78f981c8ec
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
