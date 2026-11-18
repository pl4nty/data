-- Threat: !InfrastructureShared
-- Name: d261971efb38
-- Type: 21

local l_0_0 = mp.getfilesize()
if (6291456 <= l_0_0 and l_0_0 <= 8388608 or 2097152 <= l_0_0 and l_0_0 <= 4194304) and pehdr.NumberOfSections == 10 then
  return mp.INFECTED
end
return mp.CLEAN
