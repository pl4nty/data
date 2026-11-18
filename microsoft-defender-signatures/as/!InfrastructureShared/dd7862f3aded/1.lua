-- Threat: !InfrastructureShared
-- Name: dd7862f3aded
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
