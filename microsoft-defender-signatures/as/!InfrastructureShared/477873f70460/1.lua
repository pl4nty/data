-- Threat: !InfrastructureShared
-- Name: 477873f70460
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
