-- Threat: !InfrastructureShared
-- Name: 22782662b74f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
