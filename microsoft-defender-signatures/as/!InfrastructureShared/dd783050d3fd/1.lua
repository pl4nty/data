-- Threat: !InfrastructureShared
-- Name: dd783050d3fd
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
