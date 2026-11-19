-- Threat: !InfrastructureShared
-- Name: 55402fcb2da3
-- Type: 21

if peattributes.isvbpcode ~= true and peattributes.isvbnative ~= true then
  return mp.CLEAN
end
return mp.INFECTED
