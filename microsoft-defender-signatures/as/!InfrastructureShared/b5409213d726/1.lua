-- Threat: !InfrastructureShared
-- Name: b5409213d726
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_exports == true then
  return mp.INFECTED
end
return mp.CLEAN
