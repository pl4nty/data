-- Threat: !InfrastructureShared
-- Name: d0789d4800c9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
