local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L2_1 = L1_1.image_path
    if L2_1 ~= nil then
      goto lbl_25
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_25::
L2_1 = IsPidExcluded
L3_1 = L1_1.ppid
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1.image_path
L2_1 = L2_1(L3_1)
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "ltsvc.exe$"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L2_1
L3_1 = L2_1.match
L5_1 = "([^\\]+)$"
L3_1 = L3_1(L4_1, L5_1)
L4_1 = {}
L4_1["ccmexec.exe"] = true
L4_1["gpscript.exe"] = true
L4_1["mpcmdrun.exe"] = true
L4_1["mssense.exe"] = true
L4_1["senseir.exe"] = true
L5_1 = L4_1[L3_1]
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = TrackPidAndTechnique
L6_1 = L0_1
L7_1 = "T1003"
L8_1 = "shadowcopy_access"
L5_1(L6_1, L7_1, L8_1)
L5_1 = IsDetectionThresholdMet
L6_1 = L0_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = IsDetectionThresholdMet
  L6_1 = L1_1.ppid
  L5_1 = L5_1(L6_1)
  if not L5_1 then
    goto lbl_78
  end
end
L5_1 = mp
L5_1 = L5_1.INFECTED
do return L5_1 end
::lbl_78::
L5_1 = GetTacticsTableForPid
L6_1 = L1_1.ppid
L5_1 = L5_1(L6_1)
L6_1 = L5_1.winrshost_childproc
if not L6_1 then
  L6_1 = L5_1.wsmprovhost_childproc
  if not L6_1 then
    L6_1 = L5_1.wmi_childproc
    if not L6_1 then
      L6_1 = L5_1.remotedropexe_childproc
      if not L6_1 then
        L6_1 = L5_1.python_childproc
        if not L6_1 then
          L6_1 = L5_1.rundll32_childproc
          if not L6_1 then
            L6_1 = L5_1.wscript_childproc
            if not L6_1 then
              L6_1 = L5_1.cscript_childproc
              if not L6_1 then
                L6_1 = L5_1.mshta_childproc
                if not L6_1 then
                  L6_1 = L5_1.webshell_childproc
                  if not L6_1 then
                    L6_1 = L5_1.exec_remotedroppedscript_a
                    if not L6_1 then
                      goto lbl_117
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
L6_1 = mp
L6_1 = L6_1.INFECTED
do return L6_1 end
::lbl_117::
L6_1 = mp
L6_1 = L6_1.LOWFI
return L6_1
