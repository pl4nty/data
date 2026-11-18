-- Threat: !InfrastructureShared
-- Name: 6b78e6ea1e78
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
