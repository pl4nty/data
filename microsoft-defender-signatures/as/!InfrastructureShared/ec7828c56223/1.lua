-- Threat: !InfrastructureShared
-- Name: ec7828c56223
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
