-- Threat: !InfrastructureShared
-- Name: a540e3336d78
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
