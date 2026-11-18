-- Threat: !InfrastructureShared
-- Name: 3978f190c4e1
-- Type: 21

if peattributes.isvbpcode ~= true and peattributes.isvbnative ~= true then
  return mp.CLEAN
end
return mp.LOWFI
