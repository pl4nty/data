-- Threat: !InfrastructureShared
-- Name: 2f7840ccc9bd
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
