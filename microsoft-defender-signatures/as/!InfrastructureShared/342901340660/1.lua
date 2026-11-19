-- Threat: !InfrastructureShared
-- Name: 342901340660
-- Type: 21

local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = l_0_0.match_offset + 83
local l_0_2 = 0
local l_0_3 = mp.getfilesize()
if l_0_0.is_header then
  if l_0_3 >= mp.HEADERPAGE_SZ then
    return mp.CLEAN
  end
  l_0_2 = mp.readheader(l_0_1, l_0_3 - l_0_1)
else
  if l_0_3 >= mp.FOOTERPAGE_SZ then
    return mp.CLEAN
  end
  l_0_2 = mp.readfooter(l_0_1, l_0_3 - l_0_1)
end
local l_0_4 = l_0_2:find("|base64 -d", 1, true)
if l_0_4 ~= nil then
  l_0_2 = l_0_2:sub(0, l_0_4 - 1)
  mp.vfo_add_buffer(l_0_2, "[BaseDump]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  mp.set_mpattribute("//SCPT:Base64.Encoded")
  return mp.INFECTED
end
return mp.CLEAN
