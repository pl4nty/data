-- Threat: !InfrastructureShared
-- Name: 2d78e80bfbe2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
