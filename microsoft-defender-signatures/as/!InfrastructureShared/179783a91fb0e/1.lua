-- Threat: !InfrastructureShared
-- Name: 179783a91fb0e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
