-- Threat: !InfrastructureShared
-- Name: 17d7803a4d2d2
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
