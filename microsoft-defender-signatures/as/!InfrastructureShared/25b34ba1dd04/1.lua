local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
if L2_1 ~= nil then
  L3_1 = L2_1.command_line
  if L3_1 ~= nil then
    L3_1 = L2_1.ppid
    if L3_1 ~= nil then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = L2_1.command_line
      L3_1 = L3_1(L4_1)
      L1_1 = L3_1
      L0_1 = L2_1.ppid
    end
  end
end
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1 = L3_1()
if L3_1 ~= nil then
  L4_1 = MpCommon
  L4_1 = L4_1.PathToWin32Path
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
end
if L3_1 == nil or L0_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = StringStartsWith
L5_1 = L3_1
L6_1 = "%"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L3_1
L4_1 = L3_1.find
L6_1 = "\\adminarsenal\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L5_1 = L3_1
  L4_1 = L3_1.find
  L6_1 = "ccmexec%.exe"
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L5_1 = L3_1
    L4_1 = L3_1.find
    L6_1 = "bomgar%-scc%.exe"
    L4_1 = L4_1(L5_1, L6_1)
    if not L4_1 then
      L5_1 = L3_1
      L4_1 = L3_1.find
      L6_1 = "keyacc32%.exe"
      L4_1 = L4_1(L5_1, L6_1)
      if not L4_1 then
        goto lbl_74
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_74::
L5_1 = L3_1
L4_1 = L3_1.find
L6_1 = "\\temp\\kav remote installations\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L5_1 = L3_1
  L4_1 = L3_1.find
  L6_1 = "\\logmein rescue connectonlan\\lmirescueapplet"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    goto lbl_91
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_91::
L5_1 = L3_1
L4_1 = L3_1.find
L6_1 = "\\veeam.+%.exe"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L5_1 = L3_1
  L4_1 = L3_1.find
  L6_1 = "\\f5.+%.exe"
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    goto lbl_104
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_104::
L5_1 = L3_1
L4_1 = L3_1.find
L6_1 = "\\pdq.+%.exe"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L1_1
L4_1 = L1_1.find
L6_1 = "advanced threat protection\\datacollection\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = GetTaintLevelHR
L4_1 = L4_1()
if L4_1 == "High" then
  L5_1 = mp
  L5_1 = L5_1.IsHipsRuleEnabled
  L6_1 = "01443614-cd74-433a-b99e-2ecdc07bfc25"
  L5_1 = L5_1(L6_1)
  if not L5_1 then
    L5_1 = mp
    L5_1 = L5_1.IsHipsRuleEnabled
    L6_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
    L5_1 = L5_1(L6_1)
    if not L5_1 then
      goto lbl_146
    end
  end
  L5_1 = TrackPidAndTechniqueBM
  L6_1 = L0_1
  L7_1 = "T1021.002"
  L8_1 = "tt_remediate_cantidate"
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
::lbl_146::
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
