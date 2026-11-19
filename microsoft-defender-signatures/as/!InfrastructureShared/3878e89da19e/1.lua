-- Threat: !InfrastructureShared
-- Name: 3878e89da19e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
