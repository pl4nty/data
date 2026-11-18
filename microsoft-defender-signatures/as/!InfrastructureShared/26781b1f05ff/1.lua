-- Threat: !InfrastructureShared
-- Name: 26781b1f05ff
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
