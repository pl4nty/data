-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPowerShellExchgCmdletScanA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 1048576 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1 = (mp.readfile)(0, l_0_0)
;
(mp.readprotection)(true)
local l_0_2 = l_0_1:match("</rsp:Command><rsp:Arguments>(.*)")
if l_0_2 ~= nil and l_0_2 ~= "" then
  _start = (string.find)(l_0_2, "</rsp:Arguments>", 1, true)
  if _start then
    l_0_2 = (string.sub)(l_0_2, 1, _start - 1)
  end
  if #l_0_2 % 4 >= 1 then
    l_0_2 = l_0_2 .. (string.rep)("=", 4 - #l_0_2 % 4)
  end
  l_0_2 = (MpCommon.Base64Decode)(l_0_2)
  ;
  (mp.vfo_add_buffer)(l_0_2, "[ExchgArgs]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  local l_0_3 = l_0_2:match("<BA N=\"[^\"]+\">(.*)</BA>")
  if l_0_3 ~= nil and l_0_3 ~= "" then
    l_0_3 = (MpCommon.Base64Decode)(l_0_3)
    ;
    (mp.vfo_add_buffer)(l_0_3, "[ExchgByteArray]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  end
  local l_0_4 = l_0_2:match("<t:BinaryData>(.*)</t:BinaryData>")
  if l_0_4 ~= nil and l_0_4 ~= "" then
    l_0_4 = (MpCommon.Base64Decode)(l_0_4)
    ;
    (mp.vfo_add_buffer)(l_0_4, "[ExchgbinData]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  end
  return mp.INFECTED
end
do
  return mp.CLEAN
end

