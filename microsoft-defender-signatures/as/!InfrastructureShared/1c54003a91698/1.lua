-- Threat: !InfrastructureShared
-- Name: 1c54003a91698
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
