-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11db3409798ca\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
local l_0_1 = ""
local l_0_2 = ""
local l_0_3 = ""
local l_0_4 = ""
local l_0_5 = nil
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil and (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil and (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  l_0_2 = (this_sigattrlog[4]).utf8p2
  l_0_1 = l_0_2:match("^(.-)\\\\")
  l_0_3 = (this_sigattrlog[1]).utf8p2
  l_0_4 = (this_sigattrlog[2]).utf8p2
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_5 = (sysio.RegOpenKey)(l_0_1)
  if l_0_5 then
    l_0_0 = (sysio.GetRegValueAsBinary)(l_0_5, "d")
  end
  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_6 = (MpCommon.BinaryRegExpSearch)("MZ", l_0_0)
  if l_0_6 then
    local l_0_7 = (MpCommon.BinaryRegExpSearch)("This program cannot be run in DOS mode", l_0_0)
    if l_0_7 then
      local l_0_8 = {}
      l_0_8.regbin_size = #l_0_0
      l_0_8.regPath = l_0_2
      l_0_8.regKey = l_0_1
      ;
      (bm.set_detection_string)(safeJsonSerialize(l_0_8))
      if (string.find)((string.lower)(l_0_3), (string.lower)(l_0_4)) and (sysio.IsFileExists)(l_0_4) then
        (bm.add_threat_file)(l_0_4)
      end
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

