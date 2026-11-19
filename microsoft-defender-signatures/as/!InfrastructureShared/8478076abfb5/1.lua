-- Threat: !InfrastructureShared
-- Name: 8478076abfb5
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 2500000 or 4000000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
