-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#RtfMso\0x00001878_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 4096 or l_0_0 > 1048576 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1 = (mp.readfile)(0, l_0_0)
;
(mp.readprotection)(true)
local l_0_2 = "base64.+Content%-Type:.+application/x%-mso([%s%w+/]+=?=?)"
local l_0_3 = 0
local l_0_4 = 1
while 1 do
  if l_0_3 <= 10 then
    local l_0_5, l_0_6, l_0_7 = (string.find)(l_0_1, l_0_2, l_0_4)
  end
  if not l_0_5 then
    break
  end
  if #l_0_7 > 100 then
    l_0_3 = l_0_3 + 1
    ;
    (mp.vfo_add_buffer)((MpCommon.Base64Decode)(l_0_7), "[RtfMso]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  end
  l_0_4 = l_0_6 + 1
end
do
  return mp.CLEAN
end

