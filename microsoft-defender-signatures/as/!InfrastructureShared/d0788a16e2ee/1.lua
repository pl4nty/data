-- Threat: !InfrastructureShared
-- Name: d0788a16e2ee
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
