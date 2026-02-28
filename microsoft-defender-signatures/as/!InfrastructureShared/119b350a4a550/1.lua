local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L0_1 = L1_1.ppid
    L1_1 = IsTacticObservedForPid
    L2_1 = L0_1
    L3_1 = "webshell_parent"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      L1_1 = bm
      L1_1 = L1_1.get_process_relationships
      L1_1, L2_1 = L1_1()
      L3_1 = ipairs
      L4_1 = L2_1
      L3_1, L4_1, L5_1 = L3_1(L4_1)
      for L6_1, L7_1 in L3_1, L4_1, L5_1 do
        L8_1 = TrackPidAndTechniqueBM
        L9_1 = L7_1.ppid
        L10_1 = "T1505.003"
        L11_1 = "webshell_childproc"
        L12_1 = 28800
        L8_1(L9_1, L10_1, L11_1, L12_1)
      end
      L3_1 = nil
      L4_1 = this_sigattrlog
      L4_1 = L4_1[5]
      L4_1 = L4_1.matched
      if L4_1 then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[5]
        L4_1 = L4_1.utf8p2
        if L4_1 ~= nil then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[5]
          L3_1 = L4_1.utf8p2
          if L3_1 ~= nil then
            L4_1 = string
            L4_1 = L4_1.lower
            L5_1 = L3_1
            L4_1 = L4_1(L5_1)
            L3_1 = L4_1
            L4_1 = mp
            L4_1 = L4_1.GetExecutablesFromCommandLine
            L5_1 = L3_1
            L4_1 = L4_1(L5_1)
            L5_1 = ipairs
            L6_1 = L4_1
            L5_1, L6_1, L7_1 = L5_1(L6_1)
            for L8_1, L9_1 in L5_1, L6_1, L7_1 do
              L10_1 = mp
              L10_1 = L10_1.ContextualExpandEnvironmentVariables
              L11_1 = L9_1
              L10_1 = L10_1(L11_1)
              L9_1 = L10_1
              L10_1 = sysio
              L10_1 = L10_1.IsFileExists
              L11_1 = L9_1
              L10_1 = L10_1(L11_1)
              if L10_1 then
                L10_1 = bm
                L10_1 = L10_1.add_related_file
                L11_1 = L9_1
                L10_1(L11_1)
              end
            end
          end
        end
      end
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
