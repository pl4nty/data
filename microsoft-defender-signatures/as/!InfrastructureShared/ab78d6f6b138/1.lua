-- Threat: !InfrastructureShared
-- Name: ab78d6f6b138
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 454656 and 356352 < l_0_0 then
  if hstrlog[1].matched and hstrlog[2].matched and hstrlog[3].matched then
    return mp.INFECTED
  end
  if hstrlog[1].matched and hstrlog[2].matched and hstrlog[4].matched then
    return mp.INFECTED
  end
end
return mp.CLEAN
