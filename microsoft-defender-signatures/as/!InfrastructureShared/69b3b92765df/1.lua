-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\69b3b92765df\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "ExecutableNonTextSection"
if not (this_sigattrlog[3]).matched or isnull((this_sigattrlog[3]).utf8p1) then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.PathToWin32Path)((this_sigattrlog[3]).utf8p1)
if isnull(l_0_1) then
  return mp.CLEAN
end
if not (this_sigattrlog[5]).matched or isnull((this_sigattrlog[5]).utf8p1) or isnull((this_sigattrlog[5]).utf8p2) then
  return mp.CLEAN
end
local l_0_2 = (MpCommon.PathToWin32Path)((this_sigattrlog[5]).utf8p1)
local l_0_3 = (string.match)((this_sigattrlog[5]).utf8p2, "Fsize:(%d+)")
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
for l_0_8 in (string.gmatch)(l_0_4, "([^,]+)") do
  local l_0_9, l_0_10 = (string.match)(l_0_8, "^(.-)_(%d+)")
  if not isnull(l_0_9) and not isnull(l_0_10) and tonumber(l_0_10) == l_0_3 then
    local l_0_11 = bm.add_related_string
    local l_0_12 = l_0_0
    local l_0_13 = safeJsonSerialize
    local l_0_14 = {}
    l_0_14.SectionName = l_0_9
    l_0_14.SectionSize = l_0_10
    l_0_14.EmbeddedFile = l_0_2
    l_0_14.OriginalFile = l_0_1
    l_0_13 = l_0_13(l_0_14)
    l_0_14 = bm
    l_0_14 = l_0_14.RelatedStringBMReport
    l_0_11(l_0_12, l_0_13, l_0_14)
    l_0_11 = bm
    l_0_11 = l_0_11.add_related_file
    l_0_12 = l_0_2
    l_0_11(l_0_12)
    l_0_11 = mp
    l_0_11 = l_0_11.INFECTED
    return l_0_11
  end
end
return mp.CLEAN

