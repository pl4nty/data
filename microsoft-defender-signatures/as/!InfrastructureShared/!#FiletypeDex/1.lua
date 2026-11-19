-- Threat: !InfrastructureShared
-- Name: !#Filetype:Dex
-- Type: 12

if mp.readu_u32(headerpage, 1) ~= 175662436 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 5) ~= 3486512 then
  return mp.CLEAN
end
return mp.INFECTED
