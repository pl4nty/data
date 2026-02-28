local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = this_sigattrlog
L0_1 = L0_1[11]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[11]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[11]
    L0_1 = L0_1.utf8p1
    if L0_1 ~= "" then
      L0_1 = nil
      L1_1 = this_sigattrlog
      L1_1 = L1_1[11]
      L1_1 = L1_1.utf8p1
      L2_1 = this_sigattrlog
      L2_1 = L2_1[8]
      L2_1 = L2_1.utf8p1
      L3_1 = this_sigattrlog
      L3_1 = L3_1[8]
      L3_1 = L3_1.utf8p2
      L4_1 = this_sigattrlog
      L4_1 = L4_1[9]
      L4_1 = L4_1.matched
      if L4_1 then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[9]
        L4_1 = L4_1.utf8p2
        if L4_1 ~= nil then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[9]
          L4_1 = L4_1.utf8p2
          if L4_1 ~= "" then
            L4_1 = this_sigattrlog
            L4_1 = L4_1[9]
            L0_1 = L4_1.utf8p2
        end
      end
      else
        L4_1 = this_sigattrlog
        L4_1 = L4_1[10]
        L4_1 = L4_1.matched
        if L4_1 then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[10]
          L4_1 = L4_1.utf8p2
          if L4_1 ~= nil then
            L4_1 = this_sigattrlog
            L4_1 = L4_1[10]
            L4_1 = L4_1.utf8p2
            if L4_1 ~= "" then
              L4_1 = this_sigattrlog
              L4_1 = L4_1[10]
              L0_1 = L4_1.utf8p2
            end
          end
        end
      end
      L4_1 = IsExcludedByCmdlineMacOS
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      if not L4_1 then
        L4_1 = IsExcludedByImagePathMacOS
        L5_1 = L2_1
        L4_1 = L4_1(L5_1)
        if not L4_1 then
          goto lbl_76
        end
      end
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      do return L4_1 end
      ::lbl_76::
      L5_1 = L3_1
      L4_1 = L3_1.find
      L6_1 = "/private/var/akitra/shield/upgrade"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L5_1 = L3_1
        L4_1 = L3_1.find
        L6_1 = "pmtechops.blob.core.windows.net/wiitfilerepository"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L5_1 = L3_1
          L4_1 = L3_1.find
          L6_1 = "/usr/local/jamf/bin/jamf"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            goto lbl_100
          end
        end
      end
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      do return L4_1 end
      ::lbl_100::
      L5_1 = L1_1
      L4_1 = L1_1.match
      L6_1 = "/%.[^/]+$"
      L4_1 = L4_1(L5_1, L6_1)
      if not L4_1 then
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      end
      L5_1 = L1_1
      L4_1 = L1_1.match
      L6_1 = "[^/]*$"
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 == nil or L4_1 == "" then
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        return L5_1
      end
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L0_1
      L7_1 = L4_1
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 then
        L5_1 = SuspMacPathsToMonitor
        L6_1 = L1_1
        L7_1 = true
        L5_1 = L5_1(L6_1, L7_1)
        if L5_1 then
          L5_1 = bm
          L5_1 = L5_1.add_related_string
          L6_1 = "process_cmdline"
          L7_1 = L3_1
          L8_1 = bm
          L8_1 = L8_1.RelatedStringBMReport
          L5_1(L6_1, L7_1, L8_1)
          L5_1 = mp
          L5_1 = L5_1.INFECTED
          return L5_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
