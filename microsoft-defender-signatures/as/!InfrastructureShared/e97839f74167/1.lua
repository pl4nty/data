-- Threat: !InfrastructureShared
-- Name: e97839f74167
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll == true and l_0_0 < 307200 then
  return mp.INFECTED
end
return mp.CLEAN
