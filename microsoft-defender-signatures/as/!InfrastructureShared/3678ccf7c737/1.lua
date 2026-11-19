-- Threat: !InfrastructureShared
-- Name: 3678ccf7c737
-- Type: 21

local l_0_0 = mp.getfilesize()
if 102400 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
