-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1ddb338435a16\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "%\\TimeProviders%\\+(.-)%\\"
local l_0_1 = (bm.get_current_process_startup_info)()
if isnull(l_0_1) or isnull((this_sigattrlog[2]).utf8p1) or isnull((this_sigattrlog[2]).utf8p2) or isnull((this_sigattrlog[1]).utf8p1) or isnull((this_sigattrlog[3]).utf8p1) or isnull((this_sigattrlog[4]).utf8p1) then
  return mp.CLEAN
end
local l_0_2 = (this_sigattrlog[1]).utf8p2
local l_0_3 = (this_sigattrlog[2]).utf8p2
l_0_3 = (MpCommon.PathToWin32Path)(l_0_3)
if isnull(l_0_3) then
  return mp.CLEAN
end
l_0_3 = (mp.ContextualExpandEnvironmentVariables)(l_0_3)
if isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = (string.lower)(l_0_3)
if isnull(l_0_2) and l_0_4 == "c:\\windows\\system32\\w32time.dll" then
  return mp.CLEAN
end
do
  local l_0_5 = (mp.IsKnownFriendlyFile)(l_0_3, false, true) or false
  local l_0_6 = nil
  local l_0_7 = (string.match)((this_sigattrlog[1]).utf8p1, l_0_0)
  local l_0_8 = (string.match)((this_sigattrlog[2]).utf8p1, l_0_0)
  local l_0_9 = (string.match)((this_sigattrlog[3]).utf8p1, l_0_0)
  if isnull(l_0_7) or isnull(l_0_8) or isnull(l_0_9) or isnull((string.match)((this_sigattrlog[4]).utf8p1, l_0_0)) or l_0_7 ~= l_0_8 or l_0_8 ~= l_0_9 or l_0_8 ~= (string.match)((this_sigattrlog[4]).utf8p1, l_0_0) then
    return mp.CLEAN
  end
  if l_0_7 == "vmwTimeProvider" and l_0_4 == "c:\\program files\\vmware\\vmware tools\\vmwtimeprovider\\vmwtimeprovider.dll" then
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM(l_0_1.ppid, "T1547.003", "persist_timeprovider")
  local l_0_10 = nil
  if (mp.GetParentProcInfo)() and ((mp.GetParentProcInfo)()).ppid then
    TrackPidAndTechniqueBM(((mp.GetParentProcInfo)()).ppid, "T1547.003", "persist_timeprovider")
    ;
    (bm.add_related_process)(((mp.GetParentProcInfo)()).ppid)
  end
  ;
  (bm.add_related_file)(l_0_3)
  local l_0_11 = nil
  local l_0_12 = bm.add_related_string
  local l_0_13 = "TimeProvider"
  local l_0_14 = safeJsonSerialize
  do
    l_0_14 = l_0_14({Parent = l_0_11.ppid, ProviderName = l_0_8, ProviderDLL = l_0_3, PreviousDLL = l_0_2 or "N/A", Friend = l_0_6})
    l_0_12(l_0_13, l_0_14, bm.RelatedStringBMReport)
    l_0_12 = mp
    l_0_12 = l_0_12.INFECTED
    do return l_0_12 end
    -- DECOMPILER ERROR at PC213: freeLocal<0 in 'ReleaseLocals'

  end
end

