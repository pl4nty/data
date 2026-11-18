-- Threat: !InfrastructureShared
-- Name: 30787dc7eff3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
