-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\69b3814c86f1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "ExecutableNonTextSection"
if not (this_sigattrlog[2]).matched or not (this_sigattrlog[3]).matched or not (this_sigattrlog[4]).matched then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.PathToWin32Path)((this_sigattrlog[2]).utf8p1)
local l_0_2 = (MpCommon.PathToWin32Path)((this_sigattrlog[3]).utf8p1)
local l_0_3 = (string.match)((this_sigattrlog[3]).utf8p2, "Fsize:(%d+)")
local l_0_4 = (MpCommon.PathToWin32Path)((this_sigattrlog[4]).utf8p1)
if isnull(l_0_1) or isnull(l_0_2) or isnull(l_0_3) or isnull(l_0_4) then
  return mp.CLEAN
else
  l_0_3 = tonumber(l_0_3)
end
local l_0_5 = GetRollingQueueKeyValue(l_0_0, l_0_1)
if isnull(l_0_5) then
  return mp.CLEAN
end
for l_0_9 in (string.gmatch)(l_0_5, "([^,]+)") do
  local l_0_10, l_0_11 = (string.match)(l_0_9, "^(.-)_(%d+)$")
  if not isnull(l_0_10) and not isnull(l_0_11) and l_0_3 == tonumber(l_0_11) then
    local l_0_12 = bm.add_related_string
    local l_0_13 = l_0_0
    local l_0_14 = safeJsonSerialize
    local l_0_15 = {}
    l_0_15.RQ = l_0_5 or ""
    l_0_15.SectionName = l_0_10
    l_0_15.SectionSize = l_0_11
    l_0_15.FirstP1 = (this_sigattrlog[2]).utf8p1 or ""
    l_0_15.FirstP2 = (this_sigattrlog[2]).utf8p2 or ""
    l_0_15.FirstPath = l_0_1
    l_0_15.SecondP1 = (this_sigattrlog[3]).utf8p1 or ""
    l_0_15.SecondP2 = (this_sigattrlog[3]).utf8p2 or ""
    l_0_15.SecondPath = l_0_2
    l_0_15.SecondSize = l_0_3
    l_0_15.ProcP1 = (this_sigattrlog[4]).utf8p1 or ""
    l_0_15.ProcP2 = (this_sigattrlog[4]).utf8p2 or ""
    l_0_15.ProcPath = l_0_4
    l_0_15.FirstPPID = (this_sigattrlog[2]).ppid or ""
    l_0_15.SecondPPID = (this_sigattrlog[3]).ppid or ""
    l_0_15.ProcPPID = (this_sigattrlog[4]).ppid or ""
    l_0_14 = l_0_14(l_0_15)
    l_0_15 = bm
    l_0_15 = l_0_15.RelatedStringBMReport
    l_0_12(l_0_13, l_0_14, l_0_15)
    l_0_12 = mp
    l_0_12 = l_0_12.INFECTED
    return l_0_12
  end
end
local l_0_17 = nil
local l_0_18 = bm.add_related_string
local l_0_19 = l_0_0
local l_0_20 = safeJsonSerialize
do
  l_0_20 = l_0_20({RQ = l_0_17 or "", SectionName = "No match", SectionSize = "No match", FirstP1 = (this_sigattrlog[2]).utf8p1 or "", FirstP2 = (this_sigattrlog[2]).utf8p2 or "", FirstPath = l_0_1, SecondP1 = (this_sigattrlog[3]).utf8p1 or "", SecondP2 = (this_sigattrlog[3]).utf8p2 or "", SecondPath = l_0_2, SecondSize = l_0_3, ProcP1 = (this_sigattrlog[4]).utf8p1 or "", ProcP2 = (this_sigattrlog[4]).utf8p2 or "", ProcPath = l_0_4, FirstPPID = (this_sigattrlog[2]).ppid, SecondPPID = (this_sigattrlog[3]).ppid, ProcPPID = (this_sigattrlog[4]).ppid})
  l_0_18(l_0_19, l_0_20, bm.RelatedStringBMReport)
  l_0_18 = mp
  l_0_18 = l_0_18.INFECTED
  do return l_0_18 end
  -- DECOMPILER ERROR at PC273: freeLocal<0 in 'ReleaseLocals'

end

