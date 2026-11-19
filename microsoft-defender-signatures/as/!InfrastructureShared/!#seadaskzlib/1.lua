-- Threat: !InfrastructureShared
-- Name: !#seadask.zlib
-- Type: 13

if not mp.get_mpattribute("SCRIPT:Trojan:Win32/Seadask.gen.A!dha") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 3145728 or 5242880 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2 = 1
for l_0_3 in string.gmatch(l_0_1, "eJw[%w+/]+=?=?") do
  if 10 < l_0_2 then
    break
  end
  if 3145728 < #l_0_3 and #l_0_3 < 5242880 then
    mp.set_mpattribute("//Seadask.Zlib")
    mp.vfo_add_buffer("CWSHACK\000" .. MpCommon.Base64Decode(l_0_3), string.format("[Seadask.Zlib-%x]", l_0_2), mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    break
  end
  l_0_2 = l_0_2 + 1
end
return mp.CLEAN
