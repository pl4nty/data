-- Threat: !InfrastructureShared
-- Name: 1fe78938f0350
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
