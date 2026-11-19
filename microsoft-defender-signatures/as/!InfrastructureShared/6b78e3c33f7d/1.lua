-- Threat: !InfrastructureShared
-- Name: 6b78e3c33f7d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
