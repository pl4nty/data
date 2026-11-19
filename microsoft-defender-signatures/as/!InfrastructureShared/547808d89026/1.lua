-- Threat: !InfrastructureShared
-- Name: 547808d89026
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
