-- Threat: !InfrastructureShared
-- Name: 1bc78a524aaa0
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false and mp.getfilesize() < 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
