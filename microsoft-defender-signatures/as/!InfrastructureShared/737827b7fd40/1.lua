-- Threat: !InfrastructureShared
-- Name: 737827b7fd40
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
