-- Threat: !InfrastructureShared
-- Name: 40db3b2e110c7
-- Type: 21
-- Includes: AppomalyHelpers, LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched or this_sigattrlog[10].matched then
  l_0_0 = "WebLogic"
elseif this_sigattrlog[2].matched or this_sigattrlog[11].matched then
  l_0_0 = "SysAid"
elseif this_sigattrlog[3].matched or this_sigattrlog[11].matched or this_sigattrlog[2].matched or this_sigattrlog[12].matched then
  l_0_0 = "SysAidServer"
elseif this_sigattrlog[4].matched or this_sigattrlog[13].matched then
  l_0_0 = "CrushFTP"
elseif this_sigattrlog[5].matched or this_sigattrlog[14].matched then
  l_0_0 = "FortiSSLVPN"
elseif this_sigattrlog[6].matched or this_sigattrlog[15].matched then
  l_0_0 = "Veeam"
elseif this_sigattrlog[7].matched or this_sigattrlog[16].matched then
  l_0_0 = "GoAnywhere"
elseif this_sigattrlog[8].matched or this_sigattrlog[17].matched then
  l_0_0 = "Fortinet"
elseif this_sigattrlog[9].matched or this_sigattrlog[18].matched then
  l_0_0 = "Citrix"
end
if not isEnabledApp(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
if not l_0_1.ppid then
  return mp.CLEAN
end
local l_0_2 = l_0_1.ppid
local l_0_3 = bm.get_imagepath()
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = l_0_3:match("([^\\]+)$")
local l_0_5, l_0_6 = bm.get_process_relationships()
if l_0_5 then
  for l_0_7, l_0_8 in ipairs(l_0_5) do
    if l_0_8.ppid and l_0_8.image_path then
      local l_0_9 = string.lower(l_0_8.image_path)
      if MpCommon.StringRegExpSearch("\\\\(wlserver|sysaid|crushftpservice|fortisslvpndaemon|veeam|outlook|goanywhere|fortinet)", l_0_9) then
        l_0_2 = l_0_8.ppid
        break
      end
    end
  end
end
if l_0_2 == l_0_1.ppid and not MpCommon.StringRegExpSearch("\\\\(wlserver|sysaid|crushftpservice|fortisslvpndaemon|veeam|outlook|goanywhere|fortinet)", l_0_3) then
  return mp.CLEAN
end
local l_0_10, l_0_11 = startTrackingApp(l_0_2, l_0_0, "programfiles_targeted", "PFAppTracked")
if not l_0_10 then
  bm.trigger_sig("ProcAttribError", safeJsonSerialize(l_0_11))
elseif l_0_11.IsNewApp then
  l_0_11.SignatureName = "Bm/PFA_Parent.B"
  bm.trigger_sig("SetProcessAttrib", safeJsonSerialize(l_0_11))
end
local l_0_12
local l_0_13 = mp.GetParentProcInfo()
if l_0_13 and l_0_13.image_path then
  l_0_12 = l_0_13.image_path:match("([^\\]+)$")
end
l_0_12 = l_0_12 or "None"
local l_0_14 = {}
l_0_14.ProcessName = l_0_4
l_0_14.ParentName = l_0_12
l_0_14.Source = "BM"
l_0_14.SignatureName = "Bm/PFA_Parent.B"
l_0_14.AttributeName = "PFAppTracked"
l_0_14.AttributeCategory = "programfiles_targeted"
l_0_14.ParentName = l_0_12
l_0_14.TrackedProcess = l_0_0
local l_0_15 = mp.GetProcessCommandLine(l_0_1.ppid)
local l_0_16, l_0_17 = CommandLineGrader(l_0_15)
l_0_14.CommandlineScoreIndicator = l_0_17
l_0_14.CommandlineScore = l_0_16
local l_0_18 = l_0_12 .. "_" .. l_0_4
if not IsPotentiallyClean("CleanProcessChain", l_0_0, l_0_4) and IsPotentiallyClean("CleanProcessChain_ParentChild", l_0_0, l_0_18) then
  local l_0_19, l_0_20, l_0_21 = AnomalyTableCheck("Appomaly_ChildProcName", l_0_18, 20, "MarkerRecord_" .. l_0_0)
  if l_0_19 and not l_0_20 then
    l_0_14.ProcNameWeight = GetProcessNameScore(l_0_4)
    l_0_14.AnomalyTableName = "Appomaly_ChildProcName"
    l_0_14.AnomalyTableInfo = l_0_21
    bm.trigger_sig("PFAppChildProc_D", safeJsonSerialize(l_0_14))
  end
end
bm.trigger_sig("AnomalousChildCommandline", safeJsonSerialize(l_0_14))
if l_0_1.integrity_level and not IsPotentiallyClean("CleanProcessChainPriv", l_0_0, l_0_1.integrity_level) then
  l_0_18 = l_0_12 .. "_" .. l_0_4 .. "_" .. l_0_1.integrity_level
  local l_0_22, l_0_23, l_0_24 = AnomalyTableCheck("Appomaly_ChildProcPriv", l_0_18, 20, "MarkerRecord_" .. l_0_0)
  if l_0_22 and not l_0_23 then
    l_0_14.AnomalyTableInfo = l_0_24
    l_0_14.AnomalyTableName = "Appomaly_ChildProcPriv"
    l_0_14.Key = l_0_18
    bm.trigger_sig("AnomalousChildPriv", safeJsonSerialize(l_0_14))
  end
end
return mp.CLEAN
