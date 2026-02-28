local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = {}
L5_1 = 0
L6_1 = 1
L7_1 = L0_1
L8_1 = 1
for L9_1 = L6_1, L7_1, L8_1 do
  L10_1 = sigattr_tail
  L10_1 = L10_1[L9_1]
  L10_1 = L10_1.attribute
  if L10_1 == 16389 then
    L11_1 = sigattr_tail
    L11_1 = L11_1[L9_1]
    L11_1 = L11_1.utf8p2
    if L11_1 == "ATTR_c09458eb" then
      L11_1 = sigattr_tail
      L11_1 = L11_1[L9_1]
      L11_1 = L11_1.utf8p1
      L12_1 = L11_1
      L11_1 = L11_1.lower
      L11_1 = L11_1(L12_1)
      L12_1 = mp
      L12_1 = L12_1.crc32
      L13_1 = 0
      L14_1 = L11_1
      L15_1 = 1
      L16_1 = #L11_1
      L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
      L4_1[L12_1] = L9_1
    end
  end
end
L6_1 = 1
L7_1 = L0_1
L8_1 = 1
for L9_1 = L6_1, L7_1, L8_1 do
  L10_1 = sigattr_tail
  L10_1 = L10_1[L9_1]
  L10_1 = L10_1.attribute
  if L10_1 == 16385 then
    L10_1 = sigattr_tail
    L10_1 = L10_1[L9_1]
    L10_1 = L10_1.utf8p2
    if L10_1 ~= 0 then
      L10_1 = sigattr_tail
      L10_1 = L10_1[L9_1]
      L10_1 = L10_1.utf8p2
      if L10_1 ~= "" then
        L10_1 = sigattr_tail
        L10_1 = L10_1[L9_1]
        L10_1 = L10_1.utf8p1
        L11_1 = L10_1
        L10_1 = L10_1.lower
        L10_1 = L10_1(L11_1)
        L11_1 = sigattr_tail
        L11_1 = L11_1[L9_1]
        L11_1 = L11_1.utf8p2
        L12_1 = L11_1
        L11_1 = L11_1.lower
        L11_1 = L11_1(L12_1)
        L12_1 = {}
        L13_1 = mp
        L13_1 = L13_1.crc32
        L14_1 = 0
        L15_1 = L10_1
        L16_1 = 1
        L17_1 = #L10_1
        L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
        L14_1 = L1_1[L13_1]
        if L14_1 == nil then
          L14_1 = L4_1[L13_1]
          if L14_1 ~= nil then
            L1_1[L13_1] = L9_1
            L14_1 = string
            L14_1 = L14_1.gmatch
            L15_1 = L11_1
            L16_1 = "(%w+):(%w+)"
            L14_1, L15_1, L16_1 = L14_1(L15_1, L16_1)
            for L17_1, L18_1 in L14_1, L15_1, L16_1 do
              L12_1[L17_1] = L18_1
            end
            L14_1 = tonumber
            L15_1 = L12_1.firstoff
            L14_1 = L14_1(L15_1)
            L15_1 = tonumber
            L16_1 = L12_1.biggestoff
            L15_1 = L15_1(L16_1)
            L16_1 = tonumber
            L17_1 = L12_1.totalsizewrite
            L16_1 = L16_1(L17_1)
            L17_1 = tonumber
            L18_1 = L12_1.numwrites
            L17_1 = L17_1(L18_1)
            if L14_1 ~= nil and L15_1 ~= nil and L16_1 ~= nil and L17_1 ~= nil then
              L18_1 = sysio
              L18_1 = L18_1.GetFileSize
              L19_1 = L10_1
              L18_1 = L18_1(L19_1)
              if L16_1 == L18_1 then
                L18_1 = string
                L18_1 = L18_1.find
                L19_1 = L10_1
                L20_1 = "\\[^\\]*$"
                L18_1 = L18_1(L19_1, L20_1)
                if not L18_1 then
                  L18_1 = 0
                end
                L19_1 = string
                L19_1 = L19_1.find
                L20_1 = L10_1
                L21_1 = "."
                L22_1 = L18_1
                L23_1 = true
                L19_1 = L19_1(L20_1, L21_1, L22_1, L23_1)
                if L19_1 ~= nil then
                  L20_1 = string
                  L20_1 = L20_1.sub
                  L21_1 = L10_1
                  L22_1 = L18_1 + 1
                  L23_1 = L19_1 - 1
                  L20_1 = L20_1(L21_1, L22_1, L23_1)
                  L22_1 = L10_1
                  L21_1 = L10_1.match
                  L23_1 = "%.[^%.]+$"
                  L21_1 = L21_1(L22_1, L23_1)
                  L22_1 = L2_1[L20_1]
                  if L22_1 ~= nil then
                    L22_1 = L3_1[L21_1]
                    if L22_1 ~= nil then
                      goto lbl_166
                    end
                  end
                  L2_1[L20_1] = L9_1
                  L3_1[L21_1] = L9_1
                  L5_1 = L5_1 + 1
                  if 5 <= L5_1 then
                    L22_1 = reportTimingData
                    L22_1()
                    L22_1 = mp
                    L22_1 = L22_1.INFECTED
                    return L22_1
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  ::lbl_166::
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
