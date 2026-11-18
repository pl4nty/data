-- Threat: !InfrastructureShared
-- Name: 39784c6bcdef
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
