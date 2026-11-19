-- Threat: !InfrastructureShared
-- Name: 37b78054ffde0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
