local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L1_1 = this_sigattrlog
L1_1 = L1_1[7]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[7]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[7]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if L0_1 ~= nil then
  L2_1 = L0_1
  L1_1 = L0_1.sub
  L3_1 = 1
  L4_1 = 2
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  if L1_1 ~= "\\\\" then
    L2_1 = L0_1
    L1_1 = L0_1.sub
    L3_1 = 1
    L4_1 = 3
    L1_1 = L1_1(L2_1, L3_1, L4_1)
    if L1_1 ~= "\"\\\\" then
      L2_1 = L0_1
      L1_1 = L0_1.sub
      L3_1 = 1
      L4_1 = 3
      L1_1 = L1_1(L2_1, L3_1, L4_1)
      if L1_1 ~= "'\\\\" then
        goto lbl_134
      end
    end
  end
  L1_1 = IsPidExcluded
  L2_1 = this_sigattrlog
  L2_1 = L2_1[7]
  L2_1 = L2_1.ppid
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "\\sysvol"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L2_1 = L0_1
    L1_1 = L0_1.find
    L3_1 = "\\netlogon"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L2_1 = L0_1
      L1_1 = L0_1.find
      L3_1 = "\\ccm"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L2_1 = L0_1
        L1_1 = L0_1.find
        L3_1 = "\\sccm"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          goto lbl_79
        end
      end
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  do return L1_1 end
  ::lbl_79::
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "\\release\\"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L2_1 = L0_1
    L1_1 = L0_1.find
    L3_1 = "\\debug\\"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L2_1 = L0_1
      L1_1 = L0_1.find
      L3_1 = "\\apps\\"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        goto lbl_103
      end
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  do return L1_1 end
  ::lbl_103::
  L1_1 = {}
  L1_1["node.exe"] = true
  L1_1["java.exe"] = true
  L1_1["ruby.exe"] = true
  L1_1["cefsharp.browsersubprocess.exe"] = true
  L3_1 = L0_1
  L2_1 = L0_1.match
  L4_1 = "\\([^\\]+)$"
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = L1_1[L2_1]
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = is_excluded_parent_proc_auto
  L3_1 = L3_1()
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = TrackPidAndTechniqueBM
  L4_1 = this_sigattrlog
  L4_1 = L4_1[7]
  L4_1 = L4_1.ppid
  L5_1 = "T1021.002"
  L6_1 = "exec_from_remoteshare"
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
::lbl_134::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
