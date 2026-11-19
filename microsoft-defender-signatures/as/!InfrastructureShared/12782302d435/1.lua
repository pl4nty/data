-- Threat: !InfrastructureShared
-- Name: 12782302d435
-- Type: 21

local l_0_0 = doshdr.e_lfanew + pehdr.NumberOfSections * 40 + pehdr.SizeOfOptionalHeader + 64
if mp.readu_u32(headerpage, l_0_0) == 4867584 then
  return mp.INFECTED
end
return mp.CLEAN
