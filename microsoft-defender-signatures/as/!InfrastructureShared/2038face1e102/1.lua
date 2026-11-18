-- Threat: !InfrastructureShared
-- Name: 2038face1e102
-- Type: 21

if mp.HSTR_WEIGHT > 101 then
  local l_0_0 = 0
  if hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched then
    l_0_0 = l_0_0 + 1
  end
  if hstrlog[4].matched then
    l_0_0 = l_0_0 + 1
  end
  if hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched then
    l_0_0 = l_0_0 + 1
  end
  if hstrlog[8].matched then
    l_0_0 = l_0_0 + 1
  end
  if hstrlog[9].matched then
    l_0_0 = l_0_0 + 1
  end
  if l_0_0 == 5 then
    return mp.INFECTED
  end
  local l_0_1 = 0
  if hstrlog[10].matched or hstrlog[11].matched or hstrlog[12].matched or hstrlog[13].matched then
    l_0_1 = l_0_1 + 1
  end
  if 3 <= l_0_0 and l_0_1 == 1 then
    return mp.INFECTED
  end
  mp.set_mpattribute("HSTR:TrojanDownloader:O97M/Donoff.gen!E.1")
  return mp.CLEAN
end
mp.set_mpattribute("HSTR:TrojanDownloader:O97M/Donoff.gen!E")
return mp.CLEAN
