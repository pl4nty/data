local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = this_sigattrlog
L0_1 = L0_1[14]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[15]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[16]
    L0_1 = L0_1.matched
    if L0_1 then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[17]
      L0_1 = L0_1.matched
      if L0_1 then
        L0_1 = this_sigattrlog
        L0_1 = L0_1[18]
        L0_1 = L0_1.matched
        if L0_1 then
          L0_1 = this_sigattrlog
          L0_1 = L0_1[19]
          L0_1 = L0_1.matched
          if L0_1 then
            L0_1 = this_sigattrlog
            L0_1 = L0_1[14]
            L0_1 = L0_1.utf8p1
            L1_1 = this_sigattrlog
            L1_1 = L1_1[15]
            L1_1 = L1_1.utf8p1
            L2_1 = this_sigattrlog
            L2_1 = L2_1[15]
            L2_1 = L2_1.utf8p2
            L3_1 = this_sigattrlog
            L3_1 = L3_1[16]
            L3_1 = L3_1.utf8p1
            L4_1 = this_sigattrlog
            L4_1 = L4_1[17]
            L4_1 = L4_1.utf8p1
            L5_1 = this_sigattrlog
            L5_1 = L5_1[18]
            L5_1 = L5_1.utf8p1
            L6_1 = this_sigattrlog
            L6_1 = L6_1[18]
            L6_1 = L6_1.utf8p2
            L7_1 = this_sigattrlog
            L7_1 = L7_1[19]
            L7_1 = L7_1.utf8p1
            if L0_1 == nil or L1_1 == nil or L2_1 == nil or L3_1 == nil or L4_1 == nil or L5_1 == nil or L6_1 == nil or L7_1 == nil then
              L8_1 = mp
              L8_1 = L8_1.CLEAN
              return L8_1
            end
            if L1_1 ~= L3_1 or L5_1 ~= L7_1 then
              L8_1 = mp
              L8_1 = L8_1.CLEAN
              return L8_1
            end
            L8_1 = string
            L8_1 = L8_1.len
            L9_1 = L0_1
            L8_1 = L8_1(L9_1)
            L9_1 = string
            L9_1 = L9_1.len
            L10_1 = L2_1
            L9_1 = L9_1(L10_1)
            if not (L8_1 < L9_1) then
              L8_1 = string
              L8_1 = L8_1.len
              L9_1 = L4_1
              L8_1 = L8_1(L9_1)
              L9_1 = string
              L9_1 = L9_1.len
              L10_1 = L6_1
              L9_1 = L9_1(L10_1)
              if not (L8_1 < L9_1) then
                goto lbl_104
              end
            end
            L8_1 = mp
            L8_1 = L8_1.CLEAN
            do return L8_1 end
            ::lbl_104::
            L8_1 = string
            L8_1 = L8_1.find
            L9_1 = L0_1
            L10_1 = L2_1
            L11_1 = 1
            L12_1 = true
            L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
            if L8_1 ~= nil then
              L8_1 = string
              L8_1 = L8_1.find
              L9_1 = L4_1
              L10_1 = L6_1
              L11_1 = 1
              L12_1 = true
              L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
              if L8_1 ~= nil then
                goto lbl_125
              end
            end
            L8_1 = mp
            L8_1 = L8_1.CLEAN
            do return L8_1 end
            ::lbl_125::
            L8_1 = string
            L8_1 = L8_1.match
            L9_1 = L0_1
            L10_1 = "[^\\]+$"
            L8_1 = L8_1(L9_1, L10_1)
            L9_1 = string
            L9_1 = L9_1.match
            L10_1 = L4_1
            L11_1 = "[^\\]+$"
            L9_1 = L9_1(L10_1, L11_1)
            L10_1 = string
            L10_1 = L10_1.gsub
            L11_1 = L8_1
            L12_1 = "%."
            L13_1 = ""
            L10_1, L11_1 = L10_1(L11_1, L12_1, L13_1)
            L12_1 = string
            L12_1 = L12_1.gsub
            L13_1 = L9_1
            L14_1 = "%."
            L15_1 = ""
            L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1)
            if L11_1 < 2 or L13_1 < 2 then
              L14_1 = mp
              L14_1 = L14_1.CLEAN
              return L14_1
            end
            L14_1 = string
            L14_1 = L14_1.match
            L15_1 = L2_1
            L16_1 = "[^.]+$"
            L14_1 = L14_1(L15_1, L16_1)
            L15_1 = string
            L15_1 = L15_1.match
            L16_1 = L6_1
            L17_1 = "[^.]+$"
            L15_1 = L15_1(L16_1, L17_1)
            L16_1 = string
            L16_1 = L16_1.match
            L17_1 = L0_1
            L18_1 = "[^.]+$"
            L16_1 = L16_1(L17_1, L18_1)
            L17_1 = string
            L17_1 = L17_1.match
            L18_1 = L4_1
            L19_1 = "[^.]+$"
            L17_1 = L17_1(L18_1, L19_1)
            if L14_1 == nil or L15_1 == nil or L16_1 == nil or L17_1 == nil then
              L18_1 = mp
              L18_1 = L18_1.CLEAN
              return L18_1
            end
            L18_1 = string
            L18_1 = L18_1.len
            L19_1 = L16_1
            L18_1 = L18_1(L19_1)
            if L18_1 < 4 or L14_1 == L16_1 or L15_1 == L17_1 then
              L18_1 = mp
              L18_1 = L18_1.CLEAN
              return L18_1
            end
            if L16_1 ~= L17_1 then
              L18_1 = mp
              L18_1 = L18_1.CLEAN
              return L18_1
            end
            L18_1 = mp
            L18_1 = L18_1.INFECTED
            return L18_1
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
