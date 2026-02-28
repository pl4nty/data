local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.GetScannedPPID
L1_1 = L1_1()
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "%Wpassword[%W$]"
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L2_1
  L5_1 = "%Wpass[%W$]"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = string
    L3_1 = L3_1.match
    L4_1 = L2_1
    L5_1 = "%Wpw[%W$]"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.match
      L4_1 = L2_1
      L5_1 = "%Wkey[%W$]"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        L3_1 = string
        L3_1 = L3_1.match
        L4_1 = L2_1
        L5_1 = "%W-p[%W$]"
        L3_1 = L3_1(L4_1, L5_1)
        if not L3_1 then
          L3_1 = string
          L3_1 = L3_1.match
          L4_1 = L2_1
          L5_1 = "%Wuser[%W$]"
          L3_1 = L3_1(L4_1, L5_1)
          if not L3_1 then
            L3_1 = string
            L3_1 = L3_1.match
            L4_1 = L2_1
            L5_1 = "%Wcredentials[%W$]"
            L3_1 = L3_1(L4_1, L5_1)
            if not L3_1 then
              L3_1 = string
              L3_1 = L3_1.match
              L4_1 = L2_1
              L5_1 = "%Wmysql[%W$]"
              L3_1 = L3_1(L4_1, L5_1)
              if not L3_1 then
                L3_1 = string
                L3_1 = L3_1.match
                L4_1 = L2_1
                L5_1 = "%Wtelnet[%W$]"
                L3_1 = L3_1(L4_1, L5_1)
                if not L3_1 then
                  L3_1 = string
                  L3_1 = L3_1.match
                  L4_1 = L2_1
                  L5_1 = "%Wssh[%W$]"
                  L3_1 = L3_1(L4_1, L5_1)
                  if not L3_1 then
                    L3_1 = string
                    L3_1 = L3_1.match
                    L4_1 = L2_1
                    L5_1 = "%Wroot[%W$]"
                    L3_1 = L3_1(L4_1, L5_1)
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
if not L3_1 or L0_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = TrackPidAndTechnique
L4_1 = L0_1.ppid
L5_1 = "T1552.001"
L6_1 = "CredentialAccess_BashHistoryCredentials"
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.LOWFI
return L3_1
