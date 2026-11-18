-- Threat: !InfrastructureShared
-- Name: 122786d3ac1b2
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() >= 8448 and mp.getfilesize() <= 13056 then
  return mp.INFECTED
end
return mp.CLEAN
