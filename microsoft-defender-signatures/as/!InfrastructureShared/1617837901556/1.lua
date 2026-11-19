-- Threat: !InfrastructureShared
-- Name: 1617837901556
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
