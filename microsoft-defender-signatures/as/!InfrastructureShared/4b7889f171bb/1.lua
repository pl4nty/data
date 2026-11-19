-- Threat: !InfrastructureShared
-- Name: 4b7889f171bb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
