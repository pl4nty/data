-- Threat: !InfrastructureShared
-- Name: !#RtfMso
-- Type: 13
-- MpAttributes: SCRIPT:EncodedCommand & SCRIPT:UrnSchMsOfic

local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 or 1048576 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
mp.readprotection(true)
local l_0_2 = "base64.+Content%-Type:.+application/x%-mso([%s%w+/]+=?=?)"
local l_0_3 = 0
local l_0_4 = 1
while l_0_3 <= 10 do
  local l_0_5, l_0_6, l_0_7 = string.find(l_0_1, l_0_2, l_0_4)
  if not l_0_5 then
    break
  end
  if 100 < #l_0_7 then
    l_0_3 = l_0_3 + 1
    mp.vfo_add_buffer(MpCommon.Base64Decode(l_0_7), "[RtfMso]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  end
  l_0_4 = l_0_6 + 1
end
return mp.CLEAN
