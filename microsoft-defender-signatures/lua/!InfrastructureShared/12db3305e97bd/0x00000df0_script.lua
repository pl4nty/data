-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\12db3305e97bd\0x00000df0_luac 

-- params : ...
-- function num : 0
local l_0_0 = (this_sigattrlog[3]).utf8p2
local l_0_1 = ""
if l_0_0 ~= nil and l_0_0 ~= "" then
  l_0_1 = l_0_0
  if (sysio.IsFileExists)(l_0_0) then
    (bm.add_related_file)(l_0_0)
  end
end
local l_0_2 = (this_sigattrlog[4]).utf8p2
if l_0_2 ~= nil and l_0_2 ~= "" then
  l_0_1 = l_0_1 .. "_" .. l_0_2
  if (sysio.IsFileExists)(l_0_2) then
    (bm.add_related_file)(l_0_2)
  end
end
if l_0_1 ~= "" then
  (bm.add_related_string)("ComHijackValues", l_0_1, bm.RelatedStringBMReport)
end
return mp.INFECTED

