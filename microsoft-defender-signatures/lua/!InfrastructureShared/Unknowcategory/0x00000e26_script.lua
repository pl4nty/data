-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00000e26_luac 

-- params : ...
-- function num : 0
local l_0_0 = (nri.GetRawRequestBlob)()
if (string.byte)(l_0_0, 1) ~= 5 or (string.byte)(l_0_0, 2) ~= 0 or (string.byte)(l_0_0, 3) ~= 11 then
  return mp.CLEAN
end
local l_0_1 = "([\\x00-\\xFF]+)\\x4E\\x54\\x4C\\x4D\\x53\\x53\\x50\\x00"
local l_0_2, l_0_3 = (MpCommon.BinaryRegExpSearch)(l_0_1, l_0_0)
if l_0_2 and (MpCommon.BinaryRegExpSearch)("\\x35\\x42\\x51\\xE3\\x06\\x4B\\xD1\\x11\\xAB\\x04\\x00\\xC0\\x4F\\xC2\\xDC\\xD2", l_0_3) then
  local l_0_4 = "\\x05\\x00\\x00\\x03\\x10\\x00\\x00\\x00.....\\x00\\x00\\x00....\\x00\\x00\\x00\\x00"
  local l_0_5 = "\\x05\\x00\\x00\\x03\\x10\\x00\\x00\\x00.....\\x00\\x00\\x00....\\x00\\x00\\x10\\x00"
  local l_0_6 = "\\x05\\x00\\x00\\x03\\x10\\x00\\x00\\x00.....\\x00\\x00\\x00....\\x00\\x00\\x0C\\x00"
  local l_0_7 = "\\x05\\x00\\x00\\x03\\x10\\x00\\x00\\x00.....\\x00\\x00\\x00....\\x00\\x00\\x03\\x00"
  if (MpCommon.BinaryRegExpSearch)(l_0_4, l_0_0) and (MpCommon.BinaryRegExpSearch)(l_0_5, l_0_0) and (MpCommon.BinaryRegExpSearch)(l_0_6, l_0_0) and (MpCommon.BinaryRegExpSearch)(l_0_7, l_0_0) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

