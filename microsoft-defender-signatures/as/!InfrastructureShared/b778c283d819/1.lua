-- Threat: !InfrastructureShared
-- Name: b778c283d819
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
