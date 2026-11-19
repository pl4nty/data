-- Threat: !InfrastructureShared
-- Name: 4878c47c6886
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
