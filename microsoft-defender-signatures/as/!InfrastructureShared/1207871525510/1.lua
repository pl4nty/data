-- Threat: !InfrastructureShared
-- Name: 1207871525510
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
