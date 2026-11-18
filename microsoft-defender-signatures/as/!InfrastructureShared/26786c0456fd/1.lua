-- Threat: !InfrastructureShared
-- Name: 26786c0456fd
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 8000 then
  return mp.INFECTED
end
return mp.CLEAN
