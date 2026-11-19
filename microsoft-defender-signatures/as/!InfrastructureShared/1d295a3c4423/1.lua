-- Threat: !InfrastructureShared
-- Name: 1d295a3c4423
-- Type: 21

local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = l_0_0.match_offset + 18
local l_0_2 = 0
local l_0_3 = 0
local l_0_4 = mp.getfilesize()
if l_0_0.is_header then
  if mp.HEADERPAGE_SZ >= 4095 then
    l_0_2 = 4095
  else
    l_0_2 = mp.HEADERPAGE_SZ
  end
else
  if 4095 <= mp.FOOTERPAGE_SZ then
    l_0_2 = 4095
  else
    l_0_2 = mp.FOOTERPAGE_SZ
  end
  if l_0_4 < mp.FOOTERPAGE_SZ then
    return mp.CLEAN
  end
  l_0_1 = l_0_4 - mp.FOOTERPAGE_SZ + l_0_1
end
if l_0_1 ~= nil then
  if l_0_2 > l_0_1 then
    mp.readprotection(false)
    l_0_3 = mp.readfile(l_0_1, l_0_2 - l_0_1)
    mp.vfo_add_buffer(l_0_3, "[Base64Decode]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    mp.set_mpattribute("//SCPT:Base64.Decoded")
  end
  return mp.INFECTED
end
return mp.CLEAN
