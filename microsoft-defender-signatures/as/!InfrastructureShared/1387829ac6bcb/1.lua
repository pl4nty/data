-- Threat: !InfrastructureShared
-- Name: 1387829ac6bcb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
