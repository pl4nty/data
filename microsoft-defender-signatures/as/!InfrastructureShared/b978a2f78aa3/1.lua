-- Threat: !InfrastructureShared
-- Name: b978a2f78aa3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
