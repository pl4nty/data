-- Threat: !InfrastructureShared
-- Name: a07871ed893d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
