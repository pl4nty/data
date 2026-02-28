local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = this_sigattrlog
L0_1 = L0_1[5]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[5]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[5]
    L0_1 = L0_1.utf8p1
    if L0_1 ~= "" then
      L0_1 = bm
      L0_1 = L0_1.get_current_process_startup_info
      L0_1 = L0_1()
      L1_1 = bm
      L1_1 = L1_1.get_imagepath
      L1_1 = L1_1()
      L2_1 = L0_1.command_line
      L3_1 = IsExcludedByCmdlineMacOS
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      if not L3_1 then
        L3_1 = IsExcludedByImagePathMacOS
        L4_1 = L1_1
        L3_1 = L3_1(L4_1)
        if not L3_1 then
          goto lbl_36
        end
      end
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      do return L3_1 end
      ::lbl_36::
      
      function L3_1(A0_2)
        local L1_2, L2_2, L3_2, L4_2, L5_2
        L1_2 = SuspMacPathsToMonitor
        L2_2 = A0_2
        L3_2 = true
        L1_2 = L1_2(L2_2, L3_2)
        if L1_2 then
          L1_2 = true
          return L1_2
        end
        L2_2 = A0_2
        L1_2 = A0_2.find
        L3_2 = "^/Users/[^/]+/Desktop/"
        L4_2 = 1
        L5_2 = false
        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
        if not L1_2 then
          L2_2 = A0_2
          L1_2 = A0_2.find
          L3_2 = "^/Users/[^/]+/Documents/"
          L4_2 = 1
          L5_2 = false
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
          if not L1_2 then
            L2_2 = A0_2
            L1_2 = A0_2.find
            L3_2 = "^/Users/[^/]+/Downloads/"
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
                L3_2 = "^/Users/[^/]+/Library/[^/]+/[^/]+$"
                L4_2 = 1
                L5_2 = false
                L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                if not L1_2 then
                  L2_2 = A0_2
                  L1_2 = A0_2.find
                  L3_2 = "^/Library/[^/]+$"
                  L4_2 = 1
                  L5_2 = false
                  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                  if not L1_2 then
                    L2_2 = A0_2
                    L1_2 = A0_2.find
                    L3_2 = "^/Library/[^/]+/[^/]+$"
                    L4_2 = 1
                    L5_2 = false
                    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                    if not L1_2 then
                      goto lbl_60
                    end
                  end
                end
              end
            end
          end
        end
        L1_2 = true
        do return L1_2 end
        ::lbl_60::
        L1_2 = false
        return L1_2
      end
      
      ExtendedSuspMacPathsToMonitor = L3_1
      L3_1 = this_sigattrlog
      L3_1 = L3_1[5]
      L3_1 = L3_1.utf8p1
      L4_1 = ExtendedSuspMacPathsToMonitor
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      if L4_1 then
        L5_1 = L3_1
        L4_1 = L3_1.match
        L6_1 = "/%.[^/]+$"
        L4_1 = L4_1(L5_1, L6_1)
        if not L4_1 then
          L5_1 = L3_1
          L4_1 = L3_1.match
          L6_1 = "^%.[^/]+$"
          L4_1 = L4_1(L5_1, L6_1)
          if not L4_1 then
            goto lbl_59
          end
        end
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
    end
  end
end
::lbl_59::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
