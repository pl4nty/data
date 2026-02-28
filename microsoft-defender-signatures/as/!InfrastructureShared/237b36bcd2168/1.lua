local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = bm
L0_1 = L0_1.GetSignatureMatchDuration
L0_1 = L0_1()
if 200000000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = ipairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.reason
  if L7_1 == 2 then
    L7_1 = L6_1.cmd_line
    if L7_1 ~= nil then
      L7_1 = string
      L7_1 = L7_1.lower
      L8_1 = L6_1.cmd_line
      L7_1 = L7_1(L8_1)
      L9_1 = L7_1
      L8_1 = L7_1.find
      L10_1 = "\\lenovo"
      L11_1 = 1
      L12_1 = true
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
      if not L8_1 then
        L9_1 = L7_1
        L8_1 = L7_1.find
        L10_1 = "\\eset\\bts.session"
        L11_1 = 1
        L12_1 = true
        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
        if not L8_1 then
          L9_1 = L7_1
          L8_1 = L7_1.find
          L10_1 = "\\tanium"
          L11_1 = 1
          L12_1 = true
          L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
          if not L8_1 then
            goto lbl_50
          end
        end
      end
      L8_1 = mp
      L8_1 = L8_1.CLEAN
      return L8_1
    end
  end
  ::lbl_50::
end
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[15]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[15]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[15]
    L4_1 = L4_1.utf8p1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
  end
end
if L2_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.ContextualExpandEnvironmentVariables
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  L3_1 = sysio
  L3_1 = L3_1.IsFileExists
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.IsKnownFriendlyFile
    L4_1 = L2_1
    L5_1 = true
    L6_1 = false
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if not L3_1 then
      L3_1 = bm
      L3_1 = L3_1.add_related_file
      L4_1 = L2_1
      L3_1(L4_1)
      L3_1 = AddResearchData
      L4_1 = this_sigattrlog
      L4_1 = L4_1[15]
      L4_1 = L4_1.ppid
      L5_1 = true
      L3_1(L4_1, L5_1)
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
