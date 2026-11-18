-- Threat: !InfrastructureShared
-- Name: b540481d53a5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
