-- Threat: !InfrastructureShared
-- Name: 967868442d38
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
