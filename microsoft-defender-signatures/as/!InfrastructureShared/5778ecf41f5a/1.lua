-- Threat: !InfrastructureShared
-- Name: 5778ecf41f5a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
