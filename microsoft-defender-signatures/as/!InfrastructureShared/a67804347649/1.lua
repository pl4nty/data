-- Threat: !InfrastructureShared
-- Name: a67804347649
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
