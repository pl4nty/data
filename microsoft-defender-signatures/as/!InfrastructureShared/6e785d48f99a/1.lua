-- Threat: !InfrastructureShared
-- Name: 6e785d48f99a
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
