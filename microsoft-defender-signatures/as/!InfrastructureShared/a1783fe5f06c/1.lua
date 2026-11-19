-- Threat: !InfrastructureShared
-- Name: a1783fe5f06c
-- Type: 21

if peattributes.isvbnative == true and mp.getfilesize() == 73728 then
  return mp.INFECTED
end
return mp.CLEAN
