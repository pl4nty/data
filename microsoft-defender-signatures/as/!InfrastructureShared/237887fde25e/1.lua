-- Threat: !InfrastructureShared
-- Name: 237887fde25e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
