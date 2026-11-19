-- Threat: !InfrastructureShared
-- Name: c278e5c3cbcb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
