-- Threat: !InfrastructureShared
-- Name: c4782809d9e7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
