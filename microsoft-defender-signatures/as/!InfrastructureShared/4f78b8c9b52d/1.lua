-- Threat: !InfrastructureShared
-- Name: 4f78b8c9b52d
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 102400 or 204800 < l_0_0 or peattributes.isdll then
  return mp.CLEAN
end
return mp.INFECTED
