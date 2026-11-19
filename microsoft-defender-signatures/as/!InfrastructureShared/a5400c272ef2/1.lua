-- Threat: !InfrastructureShared
-- Name: a5400c272ef2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
