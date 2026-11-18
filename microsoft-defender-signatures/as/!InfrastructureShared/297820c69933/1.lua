-- Threat: !InfrastructureShared
-- Name: 297820c69933
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
