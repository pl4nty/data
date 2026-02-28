local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  L2_1 = L0_1.ppid
  if L1_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L4_1 = L1_1
  L3_1 = L1_1.find
  L5_1 = "beremote.exe"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L4_1 = L1_1
  L3_1 = L1_1.find
  L5_1 = "bpbkar32.exe"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L4_1 = L1_1
  L3_1 = L1_1.find
  L5_1 = "caagstart.exe"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  if L2_1 ~= "" and L2_1 ~= nil then
    L3_1 = TrackPidAndTechnique
    L4_1 = L2_1
    L5_1 = "T1003.002"
    L6_1 = "credentialdumping"
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = IsTechniqueObservedForPid
    L4_1 = L2_1
    L5_1 = "iis_exch_web"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L3_1 = IsTechniqueObservedForPid
      L4_1 = L2_1
      L5_1 = "iis_exch_childproc"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        L3_1 = IsTechniqueObservedForPid
        L4_1 = L2_1
        L5_1 = "webshell_parent"
        L3_1 = L3_1(L4_1, L5_1)
        if not L3_1 then
          goto lbl_76
        end
      end
    end
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
  ::lbl_76::
  L3_1 = GetTacticsTableForPid
  L4_1 = L0_1.ppid
  L3_1 = L3_1(L4_1)
  L4_1 = L3_1.winrshost_childproc
  if not L4_1 then
    L4_1 = L3_1.wsmprovhost_childproc
    if not L4_1 then
      L4_1 = L3_1.wmi_childproc
      if not L4_1 then
        L4_1 = L3_1.remotedropexe_childproc
        if not L4_1 then
          L4_1 = L3_1.python_childproc
          if not L4_1 then
            L4_1 = L3_1.rundll32_childproc
            if not L4_1 then
              L4_1 = L3_1.wscript_childproc
              if not L4_1 then
                L4_1 = L3_1.cscript_childproc
                if not L4_1 then
                  L4_1 = L3_1.mshta_childproc
                  if not L4_1 then
                    L4_1 = L3_1.webshell_childproc
                    if not L4_1 then
                      L4_1 = L3_1.exec_remotedroppedscript_a
                      if not L4_1 then
                        goto lbl_115
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
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
::lbl_115::
L1_1 = mp
L1_1 = L1_1.LOWFI
return L1_1
