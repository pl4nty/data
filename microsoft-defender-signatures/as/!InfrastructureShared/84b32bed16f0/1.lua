local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.utf8p2
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.utf8p1
    if L0_1 ~= nil and L0_1 ~= "" and L1_1 ~= nil and L1_1 ~= "" then
      L2_1 = string
      L2_1 = L2_1.match
      L3_1 = L1_1
      L4_1 = "(/.+)/.+"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 == nil or L2_1 == "" then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L0_1
      L5_1 = L2_1
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L0_1
        L5_1 = " /tmp"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L3_1 = string
          L3_1 = L3_1.find
          L4_1 = L0_1
          L5_1 = " /var"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            L3_1 = string
            L3_1 = L3_1.find
            L4_1 = L0_1
            L5_1 = " /etc"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if not L3_1 then
              goto lbl_107
            end
          end
        end
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = "/private/"
        L5_1 = L2_1
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 ~= 1 then
          goto lbl_107
        end
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L0_1
        L5_1 = string
        L5_1 = L5_1.sub
        L6_1 = L2_1
        L7_1 = 9
        L5_1 = L5_1(L6_1, L7_1)
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          goto lbl_107
        end
      end
      L3_1 = "mac_scp_file_transfer"
      L4_1 = AppendToRollingQueue
      L5_1 = L3_1
      L6_1 = "zip_transferred_path"
      L7_1 = L1_1
      L8_1 = 7200
      L9_1 = 100
      L10_1 = 0
      L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
::lbl_107::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
