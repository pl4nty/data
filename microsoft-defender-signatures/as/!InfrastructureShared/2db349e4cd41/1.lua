local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L1_1 = {}
L2_1 = "http"
L3_1 = "://(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)"
L4_1 = "-q-i"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
  end
end
if L0_1 ~= nil then
  L2_1 = StringEndsWith
  L3_1 = L0_1
  L4_1 = ".msi\""
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = StringEndsWith
    L3_1 = L0_1
    L4_1 = ".msi\" "
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      L2_1 = 1
      L3_1 = #L1_1
      L4_1 = 1
      for L5_1 = L2_1, L3_1, L4_1 do
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L0_1
        L8_1 = L1_1[L5_1]
        L9_1 = 1
        L10_1 = true
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
        if not L6_1 then
          L6_1 = string
          L6_1 = L6_1.match
          L7_1 = L0_1
          L8_1 = L1_1[L5_1]
          L6_1 = L6_1(L7_1, L8_1)
          if not L6_1 then
            goto lbl_94
          end
        end
        L6_1 = mp
        L6_1 = L6_1.GetExecutablesFromCommandLine
        L7_1 = L0_1
        L6_1 = L6_1(L7_1)
        L7_1 = ipairs
        L8_1 = L6_1
        L7_1, L8_1, L9_1 = L7_1(L8_1)
        for L10_1, L11_1 in L7_1, L8_1, L9_1 do
          L12_1 = mp
          L12_1 = L12_1.ContextualExpandEnvironmentVariables
          L13_1 = L11_1
          L12_1 = L12_1(L13_1)
          L11_1 = L12_1
          L12_1 = sysio
          L12_1 = L12_1.IsFileExists
          L13_1 = L11_1
          L12_1 = L12_1(L13_1)
          if L12_1 then
            L12_1 = string
            L12_1 = L12_1.lower
            L13_1 = L11_1
            L12_1 = L12_1(L13_1)
            L13_1 = L12_1
            L12_1 = L12_1.match
            L14_1 = "(%w+%.exe)$"
            L12_1 = L12_1(L13_1, L14_1)
            if L12_1 ~= nil then
              L12_1 = bm
              L12_1 = L12_1.add_related_file
              L13_1 = L11_1
              L12_1(L13_1)
            end
          end
        end
        L7_1 = mp
        L7_1 = L7_1.INFECTED
        do return L7_1 end
        ::lbl_94::
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
