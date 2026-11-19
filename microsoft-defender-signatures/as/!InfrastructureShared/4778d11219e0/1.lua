-- Threat: !InfrastructureShared
-- Name: 4778d11219e0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
