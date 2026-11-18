-- Threat: !InfrastructureShared
-- Name: 2558f3fcfe1b0
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  local l_0_0 = 0
  if hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched then
    l_0_0 = l_0_0 + 1
  end
  if hstrlog[6].matched then
    l_0_0 = l_0_0 + 1
  end
  if hstrlog[7].matched then
    l_0_0 = l_0_0 + 1
  end
  if hstrlog[8].matched or hstrlog[9].matched or hstrlog[10].matched or hstrlog[11].matched then
    l_0_0 = l_0_0 + 1
  end
  if hstrlog[12].matched or hstrlog[13].matched or hstrlog[14].matched or hstrlog[15].matched or hstrlog[16].matched or hstrlog[17].matched or hstrlog[18].matched then
    l_0_0 = l_0_0 + 1
  end
  if l_0_0 == 5 then
    return mp.INFECTED
  elseif l_0_0 == 4 then
    if hstrlog[19].matched then
      return mp.SUSPICIOUS
    end
    mp.set_mpattribute("HSTR:TrojanDownloader:O97M/Donoff.gen!D.1")
    return mp.CLEAN
  end
  mp.set_mpattribute("HSTR:TrojanDownloader:O97M/Donoff.gen!D.2")
  return mp.CLEAN
end
mp.set_mpattribute("HSTR:TrojanDownloader:O97M/Donoff.gen!D")
return mp.CLEAN
