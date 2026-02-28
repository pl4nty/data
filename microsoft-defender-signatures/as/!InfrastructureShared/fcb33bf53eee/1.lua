local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = this_sigattrlog
L0_1 = L0_1[6]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[6]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = string
    L0_1 = L0_1.lower
    L1_1 = this_sigattrlog
    L1_1 = L1_1[6]
    L1_1 = L1_1.utf8p1
    L0_1 = L0_1(L1_1)
    if L0_1 ~= nil and L0_1 ~= "" then
      L2_1 = L0_1
      L1_1 = L0_1.match
      L3_1 = "\\([^\\]+)$"
      L1_1 = L1_1(L2_1, L3_1)
      L2_1 = this_sigattrlog
      L2_1 = L2_1[7]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[7]
        L2_1 = L2_1.utf8p2
        if L2_1 ~= nil then
          L2_1 = string
          L2_1 = L2_1.lower
          L3_1 = this_sigattrlog
          L3_1 = L3_1[7]
          L3_1 = L3_1.utf8p2
          L2_1 = L2_1(L3_1)
          L4_1 = L2_1
          L3_1 = L2_1.find
          L5_1 = "ablebitsdownloader.exe"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            L4_1 = L2_1
            L3_1 = L2_1.find
            L5_1 = "gzipcompress.exe"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if not L3_1 then
              L4_1 = L2_1
              L3_1 = L2_1.find
              L5_1 = "cognossessionmonitor.exe"
              L6_1 = 1
              L7_1 = true
              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
              if not L3_1 then
                L4_1 = L2_1
                L3_1 = L2_1.find
                L5_1 = "webviewhost.exe"
                L6_1 = 1
                L7_1 = true
                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                if not L3_1 then
                  goto lbl_71
                end
              end
            end
          end
          L3_1 = mp
          L3_1 = L3_1.CLEAN
          do return L3_1 end
          ::lbl_71::
          L4_1 = L2_1
          L3_1 = L2_1.find
          L5_1 = L1_1
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if L3_1 then
            L3_1 = bm
            L3_1 = L3_1.get_current_process_startup_info
            L3_1 = L3_1()
            if L3_1 ~= nil then
              L4_1 = L3_1.command_line
              if L4_1 ~= nil then
                L4_1 = L3_1.command_line
                if L4_1 ~= "" then
                  L4_1 = bm_AddRelatedFileFromCommandLine
                  L5_1 = L3_1.command_line
                  L6_1 = nil
                  L7_1 = nil
                  L8_1 = 1
                  L4_1(L5_1, L6_1, L7_1, L8_1)
                end
              end
            end
            L4_1 = mp
            L4_1 = L4_1.INFECTED
            return L4_1
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
