-- Threat: !InfrastructureShared
-- Name: ef78cad84cef
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
