-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\384b3444ec2d6\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1, l_0_2 = (MpCommon.GetProcessProtection)(l_0_0.ppid)
if (l_0_1 and l_0_1 > 0) or l_0_2 and l_0_2 ~= 0 then
  return mp.CLEAN
end
local l_0_3, l_0_4 = nil, nil
if (this_sigattrlog[16]).matched then
  l_0_3 = (this_sigattrlog[16]).utf8p1
  l_0_4 = (this_sigattrlog[16]).ppid
end
if not l_0_4 then
  local l_0_5, l_0_6 = (bm.get_process_relationships)()
  if l_0_5 then
    for l_0_10,l_0_11 in ipairs(l_0_5) do
      if l_0_11.ppid and l_0_11.image_path then
        local l_0_12 = (string.lower)(l_0_11.image_path)
        if (string.find)(l_0_12, "\\program files", 1, true) then
          do
            do
              l_0_4 = l_0_11.ppid
              do break end
              -- DECOMPILER ERROR at PC62: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC62: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC62: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC62: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC62: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end
l_0_5 = MpCommon
l_0_5 = l_0_5.StringRegExpSearch
l_0_6 = "(?i)(?:\\\\program\\sfiles(?:\\s\\(x86\\))?|%program_files%)\\\\([^\\\\]+)(\\\\[^\\\\]+\\\\)?"
l_0_5 = l_0_5(l_0_6, l_0_3)
local l_0_13, l_0_14, l_0_15 = nil
if not l_0_5 then
  l_0_14 = mp
  l_0_14 = l_0_14.CLEAN
  return l_0_14
end
l_0_14 = l_0_6 or ""
l_0_15 = l_0_14
local l_0_17 = nil
l_0_17 = l_0_13 or ""
l_0_15 = (l_0_15) .. (l_0_17)
if l_0_15 == "" then
  l_0_17 = mp
  l_0_17 = l_0_17.CLEAN
  return l_0_17
end
l_0_17 = MpCommon
l_0_17 = l_0_17.DoesProcessHaveAttribute
l_0_17 = l_0_17(l_0_0.ppid, "PFAppTracked")
if not l_0_17 then
  l_0_17 = MpCommon
  l_0_17 = l_0_17.DoesProcessHaveAttribute
  l_0_17 = l_0_17(l_0_0.ppid, "inherit:PFAppTracked")
end
if l_0_17 then
  l_0_17 = mp
  l_0_17 = l_0_17.CLEAN
  return l_0_17
end
l_0_17 = "programfiles_Net"
if not l_0_4.ppid then
  local l_0_19, l_0_20 = startTrackingApp(l_0_0.ppid, l_0_15, l_0_17)
  if not l_0_19 then
    l_0_20.SignatureName = "SetProcAttributeGen.A"
    l_0_20.ProcessName = l_0_3
    ;
    (bm.trigger_sig)("ProcAttribError", safeJsonSerialize(l_0_20))
  else
    if next(l_0_20) and l_0_20.IsNewApp then
      l_0_20.SignatureName = "SetProcAttributeGen.A"
      l_0_20.ProcessName = l_0_3
      ;
      (bm.trigger_sig)("SetProcessAttrib", safeJsonSerialize(l_0_20))
    end
  end
  return mp.CLEAN
end

