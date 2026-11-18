-- Threat: !InfrastructureShared
-- Name: 918f4ec899ce
-- Type: 21

local l_0_0 = mp.getfilesize()
if 61440 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
