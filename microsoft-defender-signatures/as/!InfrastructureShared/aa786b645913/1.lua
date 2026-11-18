-- Threat: !InfrastructureShared
-- Name: aa786b645913
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
