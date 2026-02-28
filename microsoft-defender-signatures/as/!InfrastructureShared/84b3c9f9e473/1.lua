local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L1_1 = "|.js|jse|vbs|vbe|"
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L0_1 = L2_1.utf8p2
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L0_1 = L2_1.utf8p2
    end
  end
end
if L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetExecutablesFromCommandLine
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = sysio
  L8_1 = L8_1.IsFileExists
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  if L8_1 then
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = string
    L9_1 = L9_1.sub
    L10_1 = L7_1
    L11_1 = -3
    L9_1, L10_1, L11_1, L12_1, L13_1 = L9_1(L10_1, L11_1)
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
    L9_1 = string
    L9_1 = L9_1.find
    L10_1 = L1_1
    L11_1 = L8_1
    L12_1 = 1
    L13_1 = true
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    if L9_1 then
      L9_1 = mp
      L9_1 = L9_1.GetMotwReferrerUrlForFile
      L10_1 = L7_1
      L9_1, L10_1 = L9_1(L10_1)
      if not L9_1 then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      if L10_1 then
        L11_1 = StringStartsWith
        L12_1 = L10_1
        L13_1 = "http"
        L11_1 = L11_1(L12_1, L13_1)
        if not L11_1 then
          L11_1 = StringStartsWith
          L12_1 = L10_1
          L13_1 = "www"
          L11_1 = L11_1(L12_1, L13_1)
          if not L11_1 then
            goto lbl_91
          end
        end
      end
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      do return L11_1 end
      ::lbl_91::
      L11_1 = sysio
      L11_1 = L11_1.IsFileExists
      L12_1 = L10_1
      L11_1 = L11_1(L12_1)
      if L11_1 then
        L11_1 = bm
        L11_1 = L11_1.add_related_file
        L12_1 = L10_1
        L11_1(L12_1)
        L11_1 = mp
        L11_1 = L11_1.GetMotwHostUrlForFile
        L12_1 = L10_1
        L11_1, L12_1 = L11_1(L12_1)
        if L11_1 and L12_1 then
          L13_1 = mp
          L13_1 = L13_1.INFECTED
          return L13_1
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
