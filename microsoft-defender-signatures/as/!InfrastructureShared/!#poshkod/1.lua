-- Threat: !InfrastructureShared
-- Name: !#poshkod
-- Type: 13

if not mp.get_mpattribute("SCRIPT:Poshkod.gen!A") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 1048576 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
if #l_0_1 < 4096 and 1048576 < #l_0_1 then
  return mp.CLEAN
end
for l_0_2 in string.gmatch(l_0_1, "AFsAcgBlAGYAbABl[%w+/]+=?=?") do
  if 4096 < #l_0_2 then
    mp.vfo_add_buffer(MpCommon.Base64Decode("JwBCAG0AJwA7" .. l_0_2), "[Poshkod.gen!A]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    break
  end
end
return mp.CLEAN
