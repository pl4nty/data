-- Threat: !InfrastructureShared
-- Name: 4778f21747cd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
