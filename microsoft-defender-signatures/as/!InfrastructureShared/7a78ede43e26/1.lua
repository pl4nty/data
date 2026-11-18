-- Threat: !InfrastructureShared
-- Name: 7a78ede43e26
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
