-- Threat: !InfrastructureShared
-- Name: 5e7894bf10b4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
