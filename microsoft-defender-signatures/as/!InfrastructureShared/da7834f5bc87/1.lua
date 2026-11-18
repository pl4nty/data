-- Threat: !InfrastructureShared
-- Name: da7834f5bc87
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 89000 and mp.getfilesize() < 90000 then
  return mp.INFECTED
end
return mp.CLEAN
