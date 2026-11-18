-- Threat: !InfrastructureShared
-- Name: 104613658d52d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
