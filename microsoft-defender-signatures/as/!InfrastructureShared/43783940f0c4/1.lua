-- Threat: !InfrastructureShared
-- Name: 43783940f0c4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
