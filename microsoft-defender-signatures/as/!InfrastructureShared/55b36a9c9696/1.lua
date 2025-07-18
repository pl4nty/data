-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\55b36a9c9696\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "ExecutableNonTextSection"
if not (this_sigattrlog[1]).matched or isnull((this_sigattrlog[1]).utf8p1) or not (this_sigattrlog[3]).matched or isnull((this_sigattrlog[3]).utf8p2) or not (this_sigattrlog[4]).matched or isnull((this_sigattrlog[4]).utf8p1) then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.PathToWin32Path)((this_sigattrlog[1]).utf8p1)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = GetRollingQueueKeyValue(l_0_0, l_0_1)
local l_0_3 = (string.match)((this_sigattrlog[3]).utf8p2 or "", "Fsize:(%d+)")
if isnull(l_0_2) or isnull(l_0_3) then
  return mp.CLEAN
else
  l_0_3 = tonumber(l_0_3)
end
do
  local l_0_4 = 256
  for l_0_8 in (string.gmatch)(l_0_2, "([^,]+)") do
    local l_0_9, l_0_10 = (string.match)(l_0_8, "^(.-)_(%d+)$")
    local l_0_11 = tonumber
    l_0_11 = l_0_11(l_0_10 or 0)
    l_0_10 = l_0_11
    if l_0_10 > l_0_4 or not l_0_10 then
      l_0_11 = l_0_10 - l_0_4
    end
    if not isnull(l_0_9) and l_0_11 > 0 and l_0_11 <= l_0_3 and l_0_3 <= l_0_10 + l_0_4 then
      local l_0_13 = nil
      local l_0_14 = bm.add_related_string
      local l_0_15 = l_0_0
      local l_0_16 = safeJsonSerialize
      l_0_16 = l_0_16({RQ = l_0_2 or "", SectionName = l_0_9, SectionSize = l_0_10, FirstP1 = (this_sigattrlog[1]).utf8p1 or "", FirstP2 = (this_sigattrlog[1]).utf8p2 or "", FirstPath = l_0_1, SecondP1 = (this_sigattrlog[3]).utf8p1 or "", SecondP2 = (this_sigattrlog[3]).utf8p2 or "", SecondSize = l_0_3, ProcP1 = (this_sigattrlog[4]).utf8p1 or "", ProcP2 = (this_sigattrlog[4]).utf8p2 or ""})
      l_0_14(l_0_15, l_0_16, bm.RelatedStringBMReport)
      l_0_14 = mp
      l_0_14 = l_0_14.INFECTED
      return l_0_14
    end
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR at PC188: freeLocal<0 in 'ReleaseLocals'

end

