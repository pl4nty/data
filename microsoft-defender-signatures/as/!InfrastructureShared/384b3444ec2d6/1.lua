local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = MpCommon
L1_1 = L1_1.GetProcessProtection
L2_1 = L0_1.ppid
L1_1, L2_1 = L1_1(L2_1)
if L1_1 and 0 < L1_1 or L2_1 and L2_1 ~= 0 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = nil
L4_1 = nil
L5_1 = this_sigattrlog
L5_1 = L5_1[16]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[16]
  L3_1 = L5_1.utf8p1
  L5_1 = this_sigattrlog
  L5_1 = L5_1[16]
  L4_1 = L5_1.ppid
end
if not L4_1 then
  L5_1 = bm
  L5_1 = L5_1.get_process_relationships
  L5_1, L6_1 = L5_1()
  if L5_1 then
    L7_1 = ipairs
    L8_1 = L5_1
    L7_1, L8_1, L9_1 = L7_1(L8_1)
    for L10_1, L11_1 in L7_1, L8_1, L9_1 do
      L12_1 = L11_1.ppid
      if L12_1 then
        L12_1 = L11_1.image_path
        if L12_1 then
          L12_1 = string
          L12_1 = L12_1.lower
          L13_1 = L11_1.image_path
          L12_1 = L12_1(L13_1)
          L13_1 = string
          L13_1 = L13_1.find
          L14_1 = L12_1
          L15_1 = "\\program files"
          L16_1 = 1
          L17_1 = true
          L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
          if L13_1 then
            L4_1 = L11_1.ppid
            break
          end
        end
      end
    end
  end
end
L5_1 = MpCommon
L5_1 = L5_1.StringRegExpSearch
L6_1 = "(?i)(?:\\\\program\\sfiles(?:\\s\\(x86\\))?|%program_files%)\\\\([^\\\\]+)(\\\\[^\\\\]+\\\\)?"
L7_1 = L3_1
L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = L6_1 or L8_1
if not L6_1 then
  L8_1 = ""
end
L9_1 = L8_1
L10_1 = L7_1 or L10_1
if not L7_1 then
  L10_1 = ""
end
L9_1 = L9_1 .. L10_1
if L9_1 == "" then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = MpCommon
L10_1 = L10_1.DoesProcessHaveAttribute
L11_1 = L0_1.ppid
L12_1 = "PFAppTracked"
L10_1 = L10_1(L11_1, L12_1)
if not L10_1 then
  L10_1 = MpCommon
  L10_1 = L10_1.DoesProcessHaveAttribute
  L11_1 = L0_1.ppid
  L12_1 = "inherit:PFAppTracked"
  L10_1 = L10_1(L11_1, L12_1)
  if not L10_1 then
    goto lbl_105
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
do return L10_1 end
::lbl_105::
L10_1 = "programfiles_Net"
L11_1 = startTrackingApp
L12_1 = L4_1.ppid
if not L12_1 then
  L12_1 = L0_1.ppid
end
L13_1 = L9_1
L14_1 = L10_1
L11_1, L12_1 = L11_1(L12_1, L13_1, L14_1)
if not L11_1 then
  L12_1.SignatureName = "SetProcAttributeGen.A"
  L12_1.ProcessName = L3_1
  L13_1 = bm
  L13_1 = L13_1.trigger_sig
  L14_1 = "ProcAttribError"
  L15_1 = safeJsonSerialize
  L16_1 = L12_1
  L15_1, L16_1, L17_1 = L15_1(L16_1)
  L13_1(L14_1, L15_1, L16_1, L17_1)
else
  L13_1 = next
  L14_1 = L12_1
  L13_1 = L13_1(L14_1)
  if L13_1 then
    L13_1 = L12_1.IsNewApp
    if L13_1 then
      L12_1.SignatureName = "SetProcAttributeGen.A"
      L12_1.ProcessName = L3_1
      L13_1 = bm
      L13_1 = L13_1.trigger_sig
      L14_1 = "SetProcessAttrib"
      L15_1 = safeJsonSerialize
      L16_1 = L12_1
      L15_1, L16_1, L17_1 = L15_1(L16_1)
      L13_1(L14_1, L15_1, L16_1, L17_1)
    end
  end
end
L13_1 = mp
L13_1 = L13_1.CLEAN
return L13_1
