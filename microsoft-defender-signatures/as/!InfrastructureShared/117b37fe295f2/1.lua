local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = this_sigattrlog
L0_1 = L0_1[6]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[6]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[6]
    L0_1 = L0_1.utf8p1
    if L0_1 ~= "" then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[6]
      L0_1 = L0_1.utf8p2
      if L0_1 ~= nil then
        L0_1 = this_sigattrlog
        L0_1 = L0_1[6]
        L0_1 = L0_1.utf8p2
        if L0_1 ~= "" then
          goto lbl_29
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_29::
L0_1 = this_sigattrlog
L0_1 = L0_1[6]
L0_1 = L0_1.utf8p1
L1_1 = this_sigattrlog
L1_1 = L1_1[6]
L1_1 = L1_1.utf8p2
L2_1 = IsExcludedByCmdlineMacOS
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = IsExcludedByImagePathMacOS
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    goto lbl_48
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_48::
L2_1 = this_sigattrlog
L2_1 = L2_1[7]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[7]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[7]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= "" then
      goto lbl_66
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_66::
L2_1 = this_sigattrlog
L2_1 = L2_1[7]
L2_1 = L2_1.utf8p2
L3_1 = SuspMacPathsToMonitor
L4_1 = L2_1
L5_1 = true
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  if L0_1 == L2_1 then
    L3_1 = sysio
    L3_1 = L3_1.IsFileExists
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = bm
      L3_1 = L3_1.add_threat_file
      L4_1 = L2_1
      L3_1(L4_1)
    end
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
  L4_1 = L2_1
  L3_1 = L2_1.match
  L5_1 = "[^/]*$"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 ~= nil then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L1_1
    L6_1 = L3_1
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 ~= nil then
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = L0_1
      L4_1 = L4_1(L5_1)
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L4_1
      L7_1 = "/python"
      L8_1 = -7
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 == nil then
        L5_1 = string
        L5_1 = L5_1.find
        L6_1 = L4_1
        L7_1 = "/python3"
        L8_1 = -8
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if L5_1 == nil then
          L5_1 = string
          L5_1 = L5_1.find
          L6_1 = L4_1
          L7_1 = "/sh"
          L8_1 = -3
          L9_1 = true
          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
          if L5_1 == nil then
            L5_1 = string
            L5_1 = L5_1.find
            L6_1 = L4_1
            L7_1 = "/zsh"
            L8_1 = -4
            L9_1 = true
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
            if L5_1 == nil then
              L5_1 = string
              L5_1 = L5_1.find
              L6_1 = L4_1
              L7_1 = "/bash"
              L8_1 = -5
              L9_1 = true
              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
              if L5_1 == nil then
                goto lbl_166
              end
            end
          end
        end
      end
      L5_1 = sysio
      L5_1 = L5_1.IsFileExists
      L6_1 = L2_1
      L5_1 = L5_1(L6_1)
      if L5_1 then
        L5_1 = bm
        L5_1 = L5_1.add_threat_file
        L6_1 = L2_1
        L5_1(L6_1)
      end
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
::lbl_166::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
