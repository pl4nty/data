-- Threat: !InfrastructureShared
-- Name: 16f7831b392d3
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
