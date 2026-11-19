-- Threat: !InfrastructureShared
-- Name: b6783130db89
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
