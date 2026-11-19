-- Threat: !InfrastructureShared
-- Name: 30789e6a537a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
