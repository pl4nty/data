-- Threat: !InfrastructureShared
-- Name: ce78cffc2387
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
