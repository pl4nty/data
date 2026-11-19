-- Threat: !InfrastructureShared
-- Name: 2e17820f3e39d
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
