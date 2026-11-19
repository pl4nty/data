-- Threat: !InfrastructureShared
-- Name: 71782e3dda2e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
