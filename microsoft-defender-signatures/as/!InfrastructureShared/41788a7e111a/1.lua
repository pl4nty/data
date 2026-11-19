-- Threat: !InfrastructureShared
-- Name: 41788a7e111a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
