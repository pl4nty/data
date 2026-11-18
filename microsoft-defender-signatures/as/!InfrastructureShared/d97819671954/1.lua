-- Threat: !InfrastructureShared
-- Name: d97819671954
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
