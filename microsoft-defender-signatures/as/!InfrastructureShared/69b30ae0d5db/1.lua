-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\69b30ae0d5db\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "ExecutableNonTextSection"
if not (this_sigattrlog[1]).matched or isnull((this_sigattrlog[1]).utf8p1) or not (this_sigattrlog[3]).matched or isnull((this_sigattrlog[3]).utf8p2) then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.PathToWin32Path)((this_sigattrlog[1]).utf8p1)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = GetRollingQueueKeyValue(l_0_0, l_0_1)
do
  local l_0_3 = (string.match)((this_sigattrlog[3]).utf8p2 or "", "Fsize:(%d+)")
  if isnull(l_0_2) or isnull(l_0_3) then
    return mp.CLEAN
  else
    l_0_3 = tonumber(l_0_3)
  end
  for l_0_7 in (string.gmatch)(l_0_2, "([^,]+)") do
    local l_0_8, l_0_9 = (string.match)(l_0_7, "^(.-)_(%d+)$")
    local l_0_10 = tonumber
    l_0_10 = l_0_10(l_0_9 or 0)
    l_0_9 = l_0_10
    l_0_10 = isnull
    l_0_10 = l_0_10(l_0_8)
    if not l_0_10 and l_0_3 == l_0_9 then
      l_0_10 = bm
      l_0_10 = l_0_10.add_related_string
      local l_0_12 = l_0_0
      local l_0_13 = safeJsonSerialize
      l_0_13 = l_0_13({RQ = l_0_2 or "", SectionName = l_0_8, SectionSize = l_0_9, FirstP1 = (this_sigattrlog[1]).utf8p1 or "", FirstP2 = (this_sigattrlog[1]).utf8p2 or "", FirstPath = l_0_1, SecondP1 = (this_sigattrlog[3]).utf8p1 or "", SecondP2 = (this_sigattrlog[3]).utf8p2 or "", SecondSize = l_0_3})
      l_0_10(l_0_12, l_0_13, bm.RelatedStringBMReport)
      l_0_10 = mp
      l_0_10 = l_0_10.INFECTED
      return l_0_10
    end
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR at PC151: freeLocal<0 in 'ReleaseLocals'

end

