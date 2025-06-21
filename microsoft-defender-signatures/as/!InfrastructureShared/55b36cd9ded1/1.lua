-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\55b36cd9ded1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "ExecutableNonTextSection"
if not (this_sigattrlog[2]).matched or isnull((this_sigattrlog[2]).utf8p1) then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.PathToWin32Path)((this_sigattrlog[2]).utf8p1)
if isnull(l_0_1) then
  return mp.CLEAN
end
if not (this_sigattrlog[3]).matched or isnull((this_sigattrlog[3]).utf8p1) or isnull((this_sigattrlog[3]).utf8p2) then
  return mp.CLEAN
end
local l_0_2 = (MpCommon.PathToWin32Path)((this_sigattrlog[3]).utf8p1)
local l_0_3 = (string.match)((this_sigattrlog[3]).utf8p2, "Fsize:(%d+)")
if isnull(l_0_2) or isnull(l_0_3) or l_0_1 == l_0_2 then
  return mp.CLEAN
end
l_0_3 = tonumber(l_0_3)
if l_0_3 <= 256 then
  return mp.CLEAN
end
local l_0_4 = GetRollingQueueKeyValue(l_0_0, l_0_1)
if isnull(l_0_4) then
  return mp.CLEAN
end
local l_0_5 = 256
for l_0_9 in (string.gmatch)(l_0_4, "([^,]+)") do
  local l_0_10, l_0_11 = (string.match)(l_0_9, "^(.-)_(%d+)")
  if ((l_0_11 <= l_0_5 and l_0_11) or not isnull(l_0_10)) and not isnull(l_0_11) and l_0_11 - l_0_5 <= l_0_3 and l_0_3 <= l_0_11 + l_0_5 then
    local l_0_15 = nil
    local l_0_16 = bm.add_related_string
    local l_0_17 = l_0_0
    local l_0_18 = safeJsonSerialize
    l_0_18 = l_0_18({SectionName = l_0_10, SectionSize = l_0_11, EmbeddedFile = l_0_2, OriginalFile = l_0_1})
    l_0_16(l_0_17, l_0_18, bm.RelatedStringBMReport)
    l_0_16 = bm
    l_0_16 = l_0_16.add_related_file
    l_0_17 = l_0_2
    l_0_16(l_0_17)
    l_0_16 = bm
    l_0_16 = l_0_16.trigger_sig_self_propagate
    l_0_17 = "Evasion.EmbeddedPE.AV04"
    l_0_18 = l_0_2
    l_0_16(l_0_17, l_0_18)
    l_0_16 = mp
    l_0_16 = l_0_16.INFECTED
    return l_0_16
  end
end
return mp.CLEAN

