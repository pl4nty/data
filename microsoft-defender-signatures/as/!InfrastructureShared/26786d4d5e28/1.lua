-- Threat: !InfrastructureShared
-- Name: 26786d4d5e28
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
