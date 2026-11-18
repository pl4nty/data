-- Threat: !InfrastructureShared
-- Name: d5401ec6df51
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
