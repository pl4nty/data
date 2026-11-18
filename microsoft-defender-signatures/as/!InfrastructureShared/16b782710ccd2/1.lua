-- Threat: !InfrastructureShared
-- Name: 16b782710ccd2
-- Type: 21

if peattributes.ismsil and mp.getfilesize() < 81920 then
  local l_0_0 = 0
  if hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched then
    l_0_0 = l_0_0 + 2
  end
  if hstrlog[9].matched then
    l_0_0 = l_0_0 + 1
  end
  if hstrlog[10].matched or hstrlog[11].matched or hstrlog[12].matched then
    l_0_0 = l_0_0 + 1
  end
  if 2 <= l_0_0 then
    return mp.INFECTED
  end
end
return mp.CLEAN
