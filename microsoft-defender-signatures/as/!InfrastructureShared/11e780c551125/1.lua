-- Threat: !InfrastructureShared
-- Name: 11e780c551125
-- Type: 21

if not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  if not mp.get_mpattribute("RPF:TopLevelFile") then
    return mp.CLEAN
  end
  if mp.getfilesize() >= 3145728 then
    return mp.CLEAN
  end
  local l_0_0 = hstrlog[1].matched or hstrlog[2].matched
  if not l_0_0 then
    return mp.CLEAN
  end
  if not hstrlog[7].matched then
    return mp.CLEAN
  end
  if not hstrlog[12].matched then
    return mp.CLEAN
  end
  if not hstrlog[13].matched then
    return mp.CLEAN
  end
  local l_0_1 = 0
  if hstrlog[3].matched then
    l_0_1 = l_0_1 + 1
  end
  if hstrlog[4].matched then
    l_0_1 = l_0_1 + 1
  end
  if hstrlog[5].matched then
    l_0_1 = l_0_1 + 1
  end
  if hstrlog[6].matched then
    l_0_1 = l_0_1 + 1
  end
  if l_0_1 < 2 then
    return mp.CLEAN
  end
  local l_0_2 = 0
  if hstrlog[8].matched then
    l_0_2 = l_0_2 + 1
  end
  if hstrlog[9].matched then
    l_0_2 = l_0_2 + 1
  end
  if hstrlog[10].matched then
    l_0_2 = l_0_2 + 1
  end
  if hstrlog[11].matched then
    l_0_2 = l_0_2 + 1
  end
  if l_0_2 < 2 then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
