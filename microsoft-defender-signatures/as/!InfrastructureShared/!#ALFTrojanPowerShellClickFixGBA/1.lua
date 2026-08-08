-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanPowerShellClickFixGBA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)(tostring(headerpage))
local l_0_1 = (string.gsub)(l_0_0, "[%s\'\"%+]", "")
if (string.find)(l_0_1, "values", 1, true) == nil then
  return mp.CLEAN
end
if (string.find)(l_0_1, "name", 1, true) == nil then
  return mp.CLEAN
end
if (string.find)(l_0_1, "exportedcommands", 1, true) == nil then
  return mp.CLEAN
end
if not (MpCommon.StringRegExpSearch)("\\b(?:gmo|get-module)\\b", l_0_0) then
  if not (MpCommon.StringRegExpSearch)("\\b(?:ipmo|import-module)\\b", l_0_0) then
    return mp.CLEAN
  end
  if not (MpCommon.StringRegExpSearch)("-pass(?:thru)?\\b", l_0_0) then
    return mp.CLEAN
  end
end
if not (MpCommon.StringRegExpSearch)("(?:microsoft|m[a-z]*\\*)\\.(?:powershell|p[a-z]*\\*)\\.(?:utility|u[a-z]*\\*)", l_0_1) then
  return mp.CLEAN
end
if not (MpCommon.StringRegExpSearch)("\\[[ \\t]*51[ \\t]*\\]", l_0_0) then
  return mp.CLEAN
end
if not (MpCommon.StringRegExpSearch)("\\[[ \\t]*52[ \\t]*\\]", l_0_0) then
  return mp.CLEAN
end
return mp.INFECTED

