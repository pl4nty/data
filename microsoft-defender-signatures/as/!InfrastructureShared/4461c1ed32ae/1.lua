-- Threat: !InfrastructureShared
-- Name: 4461c1ed32ae
-- Type: 21

local l_0_0 = mp.getfilesize()
if 888800 <= l_0_0 and l_0_0 <= 888850 and pehdr.NumberOfSections == 4 then
  return mp.INFECTED
end
return mp.CLEAN
