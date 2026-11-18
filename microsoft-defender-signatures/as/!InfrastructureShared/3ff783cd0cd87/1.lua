-- Threat: !InfrastructureShared
-- Name: 3ff783cd0cd87
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
