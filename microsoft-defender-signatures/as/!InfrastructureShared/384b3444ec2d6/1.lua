-- Threat: !InfrastructureShared
-- Name: 384b3444ec2d6
-- Type: 21
-- Includes: LuaFuncHelper, AppomalyHelpers

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1, l_0_2 = MpCommon.GetProcessProtection(l_0_0.ppid)
if l_0_1 and 0 < l_0_1 or l_0_2 and l_0_2 ~= 0 then
  return mp.CLEAN
end
local l_0_3, l_0_4
if this_sigattrlog[16].matched then
  l_0_3 = this_sigattrlog[16].utf8p1
  l_0_4 = this_sigattrlog[16].ppid
end
if not l_0_4 then
  local l_0_5, l_0_6 = bm.get_process_relationships()
  if l_0_5 then
    for l_0_7, l_0_8 in ipairs(l_0_5) do
      if l_0_8.ppid and l_0_8.image_path then
        local l_0_9 = string.lower(l_0_8.image_path)
        if string.find(l_0_9, "\\program files", 1, true) then
          l_0_4 = l_0_8.ppid
          break
        end
      end
    end
  end
end
local l_0_10, l_0_11, l_0_12 = MpCommon.StringRegExpSearch("(?i)(?:\\\\program\\sfiles(?:\\s\\(x86\\))?|%program_files%)\\\\([^\\\\]+)(\\\\[^\\\\]+\\\\)?", l_0_3)
if not l_0_10 then
  return mp.CLEAN
end
local l_0_13 = l_0_11 or ""
local l_0_14 = l_0_13 .. (l_0_12 or "")
if l_0_14 == "" then
  return mp.CLEAN
end
if MpCommon.DoesProcessHaveAttribute(l_0_0.ppid, "PFAppTracked") or MpCommon.DoesProcessHaveAttribute(l_0_0.ppid, "inherit:PFAppTracked") then
  return mp.CLEAN
end
local l_0_15 = "programfiles_Net"
local l_0_16, l_0_17 = startTrackingApp(l_0_4.ppid or l_0_0.ppid, l_0_14, l_0_15)
if not l_0_16 then
  l_0_17.SignatureName = "SetProcAttributeGen.A"
  l_0_17.ProcessName = l_0_3
  bm.trigger_sig("ProcAttribError", safeJsonSerialize(l_0_17))
elseif next(l_0_17) and l_0_17.IsNewApp then
  l_0_17.SignatureName = "SetProcAttributeGen.A"
  l_0_17.ProcessName = l_0_3
  bm.trigger_sig("SetProcessAttrib", safeJsonSerialize(l_0_17))
end
return mp.CLEAN
