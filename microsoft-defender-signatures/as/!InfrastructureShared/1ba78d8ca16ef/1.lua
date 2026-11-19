-- Threat: !InfrastructureShared
-- Name: 1ba78d8ca16ef
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
