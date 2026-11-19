-- Threat: !InfrastructureShared
-- Name: 52789d394ea6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
