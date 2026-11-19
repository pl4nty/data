-- Threat: !InfrastructureShared
-- Name: 577865d45f2e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
