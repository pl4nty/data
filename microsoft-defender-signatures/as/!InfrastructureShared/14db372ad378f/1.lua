local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = is_excluded_parent_proc_auto
L0_1 = L0_1()
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = bm
L0_1 = L0_1.GetSignatureMatchDuration
L0_1 = L0_1()
if 36000000000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1.command_line
    L1_1 = L1_1(L2_1)
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "\\program files"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 then
      L3_1 = L1_1
      L2_1 = L1_1.find
      L4_1 = "\\avg\\"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        L3_1 = L1_1
        L2_1 = L1_1.find
        L4_1 = "\\nintendo\\"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if not L2_1 then
          L3_1 = L1_1
          L2_1 = L1_1.find
          L4_1 = "\\tanium\\"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if not L2_1 then
            L3_1 = L1_1
            L2_1 = L1_1.find
            L4_1 = "\\netskope\\"
            L5_1 = 1
            L6_1 = true
            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
            if not L2_1 then
              L3_1 = L1_1
              L2_1 = L1_1.find
              L4_1 = "\\adobe\\"
              L5_1 = 1
              L6_1 = true
              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
              if not L2_1 then
                L3_1 = L1_1
                L2_1 = L1_1.find
                L4_1 = "\\siemens\\"
                L5_1 = 1
                L6_1 = true
                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                if not L2_1 then
                  goto lbl_80
                end
              end
            end
          end
        end
      end
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    ::lbl_80::
    L2_1 = bm_AddRelatedFileFromCommandLine
    L3_1 = L0_1.command_line
    L4_1 = nil
    L5_1 = nil
    L6_1 = 1
    L2_1(L3_1, L4_1, L5_1, L6_1)
    L2_1 = TrackPidAndTechniqueBM
    L3_1 = L0_1.ppid
    L4_1 = "T1003"
    L5_1 = "tt-thresholdmet"
    L2_1(L3_1, L4_1, L5_1)
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
