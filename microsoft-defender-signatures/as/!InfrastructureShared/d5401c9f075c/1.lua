-- Threat: !InfrastructureShared
-- Name: d5401c9f075c
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_exports == true then
  return mp.INFECTED
end
return mp.CLEAN
