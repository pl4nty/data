-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\69d_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
  local l_0_0 = (string.lower)((this_sigattrlog[1]).utf8p1)
  ;
  (bm.trigger_sig)("PowershellMasqueraded", l_0_0)
  local l_0_1, l_0_2 = l_0_0:match("^(.+\\)([^\\]+)$")
  if l_0_1 and l_0_2 and ((string.find)(l_0_1, "c:\\users\\", 1, true) or (string.find)(l_0_1, "\\temp\\", 1, true) or (string.find)(l_0_1, "\\appdata\\", 1, true) or (string.find)(l_0_1, "\\programdata\\", 1, true)) and ((string.find)(l_0_2, ".cmd.exe", 1, true) or (string.find)(l_0_2, ".bat.exe", 1, true) or (string.find)(l_0_2, ".vbs.exe", 1, true)) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

