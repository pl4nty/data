-- Threat: !InfrastructureShared
-- Name: c17844bfaad0
-- Type: 21

if peattributes.ismsil and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
