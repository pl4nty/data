-- Threat: !InfrastructureShared
-- Name: 5078970a91ca
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
