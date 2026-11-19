-- Threat: !InfrastructureShared
-- Name: 1056121aacbbd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
