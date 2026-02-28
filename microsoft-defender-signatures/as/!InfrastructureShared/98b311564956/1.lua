local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.utf8p2
    if L0_1 ~= "" then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[2]
      L0_1 = L0_1.utf8p2
      
      function L1_1(A0_2)
        local L1_2, L2_2, L3_2, L4_2, L5_2
        L2_2 = A0_2
        L1_2 = A0_2.find
        L3_2 = "^/Users/[^/]+$"
        L4_2 = 1
        L5_2 = false
        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
        if not L1_2 then
          L2_2 = A0_2
          L1_2 = A0_2.find
          L3_2 = "^/Users/[^/]+/Downloads/[^/]+$"
          L4_2 = 1
          L5_2 = false
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
          if not L1_2 then
            L2_2 = A0_2
            L1_2 = A0_2.find
            L3_2 = "^/Users/[^/]+/Library/[^/]+$"
            L4_2 = 1
            L5_2 = false
            L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
            if not L1_2 then
              L2_2 = A0_2
              L1_2 = A0_2.find
              L3_2 = "^/Users/[^/]+/Library/Application Support/[^/]+$"
              L4_2 = 1
              L5_2 = false
              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
              if not L1_2 then
                L2_2 = A0_2
                L1_2 = A0_2.find
                L3_2 = "^/Users/[^/]+/[^/]+$"
                L4_2 = 1
                L5_2 = false
                L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                if not L1_2 then
                  L2_2 = A0_2
                  L1_2 = A0_2.find
                  L3_2 = "^/tmp/[^/]+$"
                  L4_2 = 1
                  L5_2 = false
                  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                  if not L1_2 then
                    L2_2 = A0_2
                    L1_2 = A0_2.find
                    L3_2 = "^/private/tmp/[^/]+$"
                    L4_2 = 1
                    L5_2 = false
                    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                    if not L1_2 then
                      goto lbl_52
                    end
                  end
                end
              end
            end
          end
        end
        L1_2 = true
        do return L1_2 end
        ::lbl_52::
        L1_2 = false
        return L1_2
      end
      
      ExtendedSuspMacPathsToMonitor = L1_1
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "/Users/Shared/.com.googlecode.munki."
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if L1_1 then
        L1_1 = mp
        L1_1 = L1_1.CLEAN
        return L1_1
      end
      L1_1 = ExtendedSuspMacPathsToMonitor
      L2_1 = L0_1
      L1_1 = L1_1(L2_1)
      if L1_1 then
        L1_1 = sysio
        L1_1 = L1_1.IsFileExists
        L2_1 = L0_1
        L1_1 = L1_1(L2_1)
        if L1_1 then
          L1_1 = bm
          L1_1 = L1_1.add_threat_file
          L2_1 = L0_1
          L1_1(L2_1)
          L1_1 = bm
          L1_1 = L1_1.trigger_sig
          L2_1 = "BmTraverseTreeBlockMac"
          L3_1 = "Detected"
          L1_1(L2_1, L3_1)
        end
        L1_1 = mp
        L1_1 = L1_1.INFECTED
        return L1_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
