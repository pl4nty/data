local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = 1
L2_1 = mp
L2_1 = L2_1.SIGATTR_LOG_SZ
L3_1 = 1
for L4_1 = L1_1, L2_1, L3_1 do
  L5_1 = sigattr_tail
  L5_1 = L5_1[L4_1]
  L5_1 = L5_1.matched
  if L5_1 then
    L5_1 = sigattr_tail
    L5_1 = L5_1[L4_1]
    L5_1 = L5_1.attribute
    if L5_1 == 16401 then
      L5_1 = sigattr_tail
      L5_1 = L5_1[L4_1]
      L0_1 = L5_1.utf8p2
      if L0_1 ~= nil then
        L5_1 = mp
        L5_1 = L5_1.GetExecutablesFromCommandLine
        L6_1 = L0_1
        L5_1 = L5_1(L6_1)
        L6_1 = ipairs
        L7_1 = L5_1
        L6_1, L7_1, L8_1 = L6_1(L7_1)
        for L9_1, L10_1 in L6_1, L7_1, L8_1 do
          L11_1 = mp
          L11_1 = L11_1.ContextualExpandEnvironmentVariables
          L12_1 = L10_1
          L11_1 = L11_1(L12_1)
          L10_1 = L11_1
          L11_1 = sysio
          L11_1 = L11_1.IsFileExists
          L12_1 = L10_1
          L11_1 = L11_1(L12_1)
          if L11_1 then
            L11_1 = bm
            L11_1 = L11_1.add_related_file
            L12_1 = L10_1
            L11_1(L12_1)
          end
        end
      end
    end
  end
end
L1_1 = add_parents
L1_1()
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1490"
L4_1 = "impair_recovery"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
