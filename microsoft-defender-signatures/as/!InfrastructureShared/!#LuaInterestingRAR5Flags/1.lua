local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = 0
  L2_2 = A0_2.val
  L2_2 = L2_2[1]
  L3_2 = 0
  while 127 < L2_2 do
    L4_2 = mp
    L4_2 = L4_2.shl32
    L5_2 = mp
    L5_2 = L5_2.bitand
    L6_2 = L2_2
    L7_2 = 127
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = L3_2 * 7
    L4_2 = L4_2(L5_2, L6_2)
    L1_2 = L1_2 + L4_2
    L3_2 = L3_2 + 1
    L4_2 = A0_2.val
    L5_2 = L3_2 + 1
    L2_2 = L4_2[L5_2]
  end
  L4_2 = mp
  L4_2 = L4_2.shl32
  L5_2 = mp
  L5_2 = L5_2.bitand
  L6_2 = L2_2
  L7_2 = 127
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L3_2 * 7
  L4_2 = L4_2(L5_2, L6_2)
  L1_2 = L1_2 + L4_2
  return L1_2
end

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2
  L1_2 = headerpage
  L2_2 = A0_2 + 4
  L1_2 = L1_2[L2_2]
  L2_2 = headerpage
  L3_2 = A0_2 + 5
  L2_2 = L2_2[L3_2]
  L3_2 = headerpage
  L4_2 = A0_2 + 6
  L3_2 = L3_2[L4_2]
  L4_2 = 0
  L5_2 = 0
  L6_2 = 0
  L7_2 = 0
  L8_2 = 0
  L9_2 = 0
  if L2_2 == 3 and L3_2 == 2 then
    L10_2 = mp
    L10_2 = L10_2.set_mpattribute
    L11_2 = "Lua:Rar5HasCommentBlock"
    L10_2(L11_2)
    L4_2 = 7
    L10_2 = headerpage
    L11_2 = A0_2 + L4_2
    L10_2 = L10_2[L11_2]
    L11_2 = headerpage
    L12_2 = A0_2 + L4_2
    L12_2 = L12_2 + 1
    L11_2 = L11_2[L12_2]
    L12_2 = headerpage
    L13_2 = A0_2 + L4_2
    L13_2 = L13_2 + 2
    L12_2 = L12_2[L13_2]
    L13_2 = headerpage
    L14_2 = A0_2 + L4_2
    L14_2 = L14_2 + 3
    L13_2 = L13_2[L14_2]
    L14_2 = 0
    if L12_2 == 4 and L13_2 ~= 4 then
      L14_2 = 2
      L15_2 = {}
      L16_2 = {}
      L17_2 = L10_2
      L18_2 = L11_2
      L16_2[1] = L17_2
      L16_2[2] = L18_2
      L15_2.val = L16_2
      L16_2 = L0_1
      L17_2 = L15_2
      L16_2 = L16_2(L17_2)
      L9_2 = L16_2
      L16_2 = mp
      L16_2 = L16_2.HEADERPAGE_SZ
      if L9_2 > L16_2 then
        L16_2 = mp
        L16_2 = L16_2.set_mpattribute
        L17_2 = "Lua:Rar5HasCommentBlockTooBig"
        L16_2(L17_2)
        L16_2 = mp
        L16_2 = L16_2.CLEAN
        return L16_2
      end
    else
      L15_2 = mp
      L15_2 = L15_2.set_mpattribute
      L16_2 = "Lua:Rar5PotentiallyCorruptCommentBlock"
      L15_2(L16_2)
      L15_2 = mp
      L15_2 = L15_2.CLEAN
      return L15_2
    end
    L15_2 = L4_2 + L14_2
    L15_2 = L15_2 + 1
    L4_2 = L15_2 + L14_2
    L15_2 = headerpage
    L16_2 = A0_2 + L4_2
    L15_2 = L15_2[L16_2]
    if L15_2 ~= 0 then
      L16_2 = mp
      L16_2 = L16_2.CLEAN
      return L16_2
    end
    L16_2 = L4_2 + 1
    L16_2 = L16_2 + 4
    L16_2 = L16_2 + 2
    L16_2 = L16_2 + 1
    L4_2 = L16_2 + 1
    L16_2 = headerpage
    L17_2 = A0_2 + L4_2
    L16_2 = L16_2[L17_2]
    if L16_2 ~= 67 then
      L17_2 = mp
      L17_2 = L17_2.CLEAN
      return L17_2
    end
    L17_2 = L4_2 + 3
    L4_2 = L17_2 + L9_2
    L17_2 = headerpage
    L18_2 = A0_2 + L4_2
    L18_2 = L18_2 + 4
    L6_2 = L17_2[L18_2]
    L1_2 = L6_2
    L17_2 = headerpage
    L18_2 = A0_2 + L4_2
    L18_2 = L18_2 + 4
    L18_2 = L18_2 + 1
    L7_2 = L17_2[L18_2]
    L17_2 = headerpage
    L18_2 = A0_2 + L4_2
    L18_2 = L18_2 + 4
    L18_2 = L18_2 + 1
    L18_2 = L18_2 + 1
    L8_2 = L17_2[L18_2]
  end
  if L2_2 == 1 and L3_2 == 2 or L7_2 == 1 and L8_2 == 2 then
    L5_2 = 2
    L10_2 = L4_2 + 4
    L10_2 = L10_2 + L5_2
    L10_2 = L10_2 + 1
    L10_2 = L10_2 + 1
    L4_2 = L10_2 + 1
  elseif L2_2 == 2 or L7_2 == 2 then
    L5_2 = 1
    L10_2 = L4_2 + 4
    L10_2 = L10_2 + L5_2
    L10_2 = L10_2 + 1
    L10_2 = L10_2 + 1
    L4_2 = L10_2 + 1
  elseif L2_2 == 5 and L3_2 == 4 then
    L10_2 = mp
    L10_2 = L10_2.set_mpattribute
    L11_2 = "Lua:Rar5HasNoFileInside"
    L10_2(L11_2)
    L10_2 = mp
    L10_2 = L10_2.CLEAN
    return L10_2
  end
  if L3_2 == 2 or L8_2 == 2 or L2_2 == 2 or L7_2 == 2 then
    L10_2 = A0_2 + L1_2
    L11_2 = mp
    L11_2 = L11_2.HEADERPAGE_SZ
    if L10_2 < L11_2 then
      L10_2 = headerpage
      L11_2 = A0_2 + L4_2
      L11_2 = L11_2 + 1
      L10_2 = L10_2[L11_2]
      L11_2 = 0
      L12_2 = 0
      L13_2 = 0
      L14_2 = 0
      L15_2 = 0
      L16_2 = 1
      L17_2 = 1
      if L10_2 == 0 then
        L16_2 = 2
        L17_2 = L16_2
      elseif 0 < L10_2 and L10_2 < 256 then
        L18_2 = headerpage
        L19_2 = A0_2 + L4_2
        L19_2 = L19_2 + 2
        L11_2 = L18_2[L19_2]
        if L11_2 == 4 then
          L18_2 = headerpage
          L19_2 = A0_2 + L4_2
          L19_2 = L19_2 + 3
          L15_2 = L18_2[L19_2]
          if L15_2 == 4 then
            L16_2 = 3
          else
            L16_2 = 2
          end
        elseif L11_2 == 0 then
          L16_2 = 3
        elseif 0 < L11_2 and L11_2 < 256 then
          L18_2 = headerpage
          L19_2 = A0_2 + L4_2
          L19_2 = L19_2 + 3
          L12_2 = L18_2[L19_2]
          if L12_2 == 4 then
            L18_2 = headerpage
            L19_2 = A0_2 + L4_2
            L19_2 = L19_2 + 4
            L15_2 = L18_2[L19_2]
            if L15_2 == 4 then
              L16_2 = 4
            else
              L16_2 = 3
            end
          elseif L12_2 == 0 then
            L16_2 = 4
          elseif 0 < L12_2 and L12_2 < 256 then
            L18_2 = headerpage
            L19_2 = A0_2 + L4_2
            L19_2 = L19_2 + 4
            L13_2 = L18_2[L19_2]
            if L13_2 == 4 then
              L18_2 = headerpage
              L19_2 = A0_2 + L4_2
              L19_2 = L19_2 + 5
              L15_2 = L18_2[L19_2]
              if L15_2 == 4 then
                L16_2 = 5
              else
                L16_2 = 4
              end
            elseif L13_2 == 0 then
              L16_2 = 5
            elseif 0 < L13_2 and L13_2 < 256 then
              L18_2 = headerpage
              L19_2 = A0_2 + L4_2
              L19_2 = L19_2 + 5
              L14_2 = L18_2[L19_2]
              if L14_2 == 4 then
                L18_2 = headerpage
                L19_2 = A0_2 + L4_2
                L19_2 = L19_2 + 6
                L15_2 = L18_2[L19_2]
                if L15_2 == 4 then
                  L16_2 = 6
                else
                  L16_2 = 5
                end
              elseif L14_2 == 0 then
                L16_2 = 6
              elseif 0 < L14_2 and L14_2 < 256 then
                L18_2 = mp
                L18_2 = L18_2.CLEAN
                return L18_2
              end
            end
          end
        end
      end
      L17_2 = L16_2
      L18_2 = L4_2 + L16_2
      L18_2 = L18_2 + 1
      L18_2 = L18_2 + L17_2
      L19_2 = headerpage
      L20_2 = A0_2 + L18_2
      L19_2 = L19_2[L20_2]
      if L19_2 ~= 32 then
        L20_2 = mp
        L20_2 = L20_2.CLEAN
        return L20_2
      end
      L20_2 = L4_2 + L16_2
      L20_2 = L20_2 + 1
      L20_2 = L20_2 + L17_2
      L20_2 = L20_2 + 1
      L20_2 = L20_2 + 4
      L21_2 = headerpage
      L22_2 = A0_2 + L20_2
      L22_2 = L22_2 + 1
      L21_2 = L21_2[L22_2]
      L22_2 = L20_2 + 2
      L4_2 = L22_2 + 1
      L22_2 = headerpage
      L23_2 = A0_2 + L4_2
      L22_2 = L22_2[L23_2]
      if L22_2 == 0 then
        L23_2 = mp
        L23_2 = L23_2.CLEAN
        return L23_2
      end
      L23_2 = L4_2 + 1
      L24_2 = 0
      L25_2 = ""
      L26_2 = ""
      L27_2 = "%."
      L28_2 = 0
      L29_2 = L22_2 - 1
      L30_2 = 1
      for L31_2 = L28_2, L29_2, L30_2 do
        L32_2 = headerpage
        L33_2 = A0_2 + L23_2
        L33_2 = L33_2 + L31_2
        L24_2 = L32_2[L33_2]
        L32_2 = string
        L32_2 = L32_2.char
        L33_2 = L24_2
        L32_2 = L32_2(L33_2)
        L25_2 = L32_2
        L32_2 = L26_2
        L33_2 = L25_2
        L26_2 = L32_2 .. L33_2
      end
      L29_2 = L26_2
      L28_2 = L26_2.match
      L30_2 = "password"
      L28_2 = L28_2(L29_2, L30_2)
      if L28_2 then
        L28_2 = mp
        L28_2 = L28_2.set_mpattribute
        L29_2 = "Lua:Rar5HasFileNameWithKeyWord"
        L28_2(L29_2)
      end
      L29_2 = L26_2
      L28_2 = L26_2.match
      L30_2 = "/"
      L28_2 = L28_2(L29_2, L30_2)
      if L28_2 then
        L28_2 = mp
        L28_2 = L28_2.set_mpattribute
        L29_2 = "Lua:Rar5HasFolder"
        L28_2(L29_2)
      end
      L29_2 = L26_2
      L28_2 = L26_2.find
      L30_2 = L27_2
      L28_2 = L28_2(L29_2, L30_2)
      if not L28_2 then
        L28_2 = mp
        L28_2 = L28_2.set_mpattribute
        L29_2 = "Lua:Rar5FirstFileHasNoExtension"
        L28_2(L29_2)
      end
      if not (4 < L22_2) then
        goto lbl_575
      end
      L28_2 = {}
      L28_2[".bat"] = ""
      L28_2[".cmd"] = ""
      L28_2[".com"] = ""
      L28_2[".cpl"] = ""
      L28_2[".exe"] = ""
      L28_2[".pif"] = ""
      L28_2[".scr"] = ""
      L28_2[".vbs"] = ""
      L28_2[".lnk"] = ""
      L28_2[".wsf"] = ""
      L28_2[".vbe"] = ""
      L28_2[".jse"] = ""
      L28_2[".hta"] = ""
      L28_2[".js"] = ""
      L28_2[".dll"] = ""
      L28_2[".ocx"] = ""
      L28_2[".ps1"] = ""
      L28_2[".jar"] = ""
      L28_2[".wsc"] = ""
      L28_2[".wsh"] = ""
      L28_2[".msi"] = ""
      L28_2[".url"] = ""
      L29_2 = {}
      L29_2[".html"] = ""
      L30_2 = {}
      L30_2[".zip"] = ""
      L30_2[".tar"] = ""
      L30_2[".gz"] = ""
      L30_2[".tgz"] = ""
      L30_2[".7z"] = ""
      L30_2[".iso"] = ""
      L30_2[".vhd"] = ""
      L30_2[".img"] = ""
      L30_2[".dmg"] = ""
      L31_2 = {}
      L31_2[".txt"] = ""
      L31_2[".pdf"] = ""
      L31_2[".xls"] = ""
      L31_2[".xlsx"] = ""
      L31_2[".xlsm"] = ""
      L31_2[".xlsb"] = ""
      L31_2[".xla"] = ""
      L31_2[".xltm"] = ""
      L31_2[".xlam"] = ""
      L31_2[".csv"] = ""
      L31_2[".xml"] = ""
      L31_2[".jpg"] = ""
      L31_2[".gif"] = ""
      L31_2[".png"] = ""
      L31_2[".jpeg"] = ""
      L31_2[".pic"] = ""
      L31_2[".mp3"] = ""
      L31_2[".doc"] = ""
      L31_2[".docx"] = ""
      L31_2[".mkv"] = ""
      L32_2 = string
      L32_2 = L32_2.sub
      L33_2 = L26_2
      L34_2 = -4
      L32_2 = L32_2(L33_2, L34_2)
      L33_2 = string
      L33_2 = L33_2.sub
      L34_2 = L26_2
      L35_2 = -5
      L33_2 = L33_2(L34_2, L35_2)
      L34_2 = string
      L34_2 = L34_2.sub
      L35_2 = L26_2
      L36_2 = -3
      L34_2 = L34_2(L35_2, L36_2)
      L35_2 = L28_2[L32_2]
      if not L35_2 then
        L35_2 = L31_2[L32_2]
        if not L35_2 then
          goto lbl_466
        end
      end
      L35_2 = string
      L35_2 = L35_2.sub
      L36_2 = L32_2
      L37_2 = 2
      L35_2 = L35_2(L36_2, L37_2)
      L32_2 = L35_2
      if L21_2 ~= 0 then
        L35_2 = mp
        L35_2 = L35_2.set_mpattribute
        L36_2 = "Lua:Rar5HasFileWith!"
        L37_2 = L32_2
        L36_2 = L36_2 .. L37_2
        L35_2(L36_2)
      else
        L35_2 = mp
        L35_2 = L35_2.set_mpattribute
        L36_2 = "Lua:Rar5HasStoredFileWith!"
        L37_2 = L32_2
        L36_2 = L36_2 .. L37_2
        L35_2(L36_2)
      end
      ::lbl_466::
      L35_2 = L28_2[L34_2]
      if L35_2 then
        L35_2 = string
        L35_2 = L35_2.sub
        L36_2 = L34_2
        L37_2 = 2
        L35_2 = L35_2(L36_2, L37_2)
        L34_2 = L35_2
        if L21_2 ~= 0 then
          L35_2 = mp
          L35_2 = L35_2.set_mpattribute
          L36_2 = "Lua:Rar5HasFileWith!"
          L37_2 = L34_2
          L36_2 = L36_2 .. L37_2
          L35_2(L36_2)
        else
          L35_2 = mp
          L35_2 = L35_2.set_mpattribute
          L36_2 = "Lua:Rar5HasStoredFileWith!"
          L37_2 = L34_2
          L36_2 = L36_2 .. L37_2
          L35_2(L36_2)
        end
      end
      L35_2 = L30_2[L32_2]
      if L35_2 then
        L35_2 = string
        L35_2 = L35_2.sub
        L36_2 = L32_2
        L37_2 = 2
        L35_2 = L35_2(L36_2, L37_2)
        L32_2 = L35_2
        if L21_2 ~= 0 then
          L35_2 = mp
          L35_2 = L35_2.set_mpattribute
          L36_2 = "Lua:Rar5HasArchiveWith!"
          L37_2 = L32_2
          L36_2 = L36_2 .. L37_2
          L35_2(L36_2)
        else
          L35_2 = mp
          L35_2 = L35_2.set_mpattribute
          L36_2 = "Lua:Rar5HasStoredArchiveWith!"
          L37_2 = L32_2
          L36_2 = L36_2 .. L37_2
          L35_2(L36_2)
        end
      end
      L35_2 = L30_2[L34_2]
      if L35_2 then
        L35_2 = string
        L35_2 = L35_2.sub
        L36_2 = L34_2
        L37_2 = 2
        L35_2 = L35_2(L36_2, L37_2)
        L34_2 = L35_2
        if L21_2 ~= 0 then
          L35_2 = mp
          L35_2 = L35_2.set_mpattribute
          L36_2 = "Lua:Rar5HasArchiveWith!"
          L37_2 = L34_2
          L36_2 = L36_2 .. L37_2
          L35_2(L36_2)
        else
          L35_2 = mp
          L35_2 = L35_2.set_mpattribute
          L36_2 = "Lua:Rar5HasStoredArchiveWith!"
          L37_2 = L34_2
          L36_2 = L36_2 .. L37_2
          L35_2(L36_2)
        end
      end
      if L33_2 ~= nil then
        L35_2 = L29_2[L33_2]
        if not L35_2 then
          L35_2 = L31_2[L33_2]
        end
        if L35_2 then
          L35_2 = string
          L35_2 = L35_2.sub
          L36_2 = L33_2
          L37_2 = 2
          L35_2 = L35_2(L36_2, L37_2)
          L33_2 = L35_2
          if L21_2 ~= 0 then
            L35_2 = mp
            L35_2 = L35_2.set_mpattribute
            L36_2 = "Lua:Rar5HasFileWith!"
            L37_2 = L33_2
            L36_2 = L36_2 .. L37_2
            L35_2(L36_2)
          else
            L35_2 = mp
            L35_2 = L35_2.set_mpattribute
            L36_2 = "Lua:Rar5HasStoredFileWith!"
            L37_2 = L33_2
            L36_2 = L36_2 .. L37_2
            L35_2(L36_2)
          end
        end
      end
  end
  else
    L10_2 = mp
    L10_2 = L10_2.set_mpattribute
    L11_2 = "Lua:Rar5HasNoFileOrCommentBlock"
    L10_2(L11_2)
    L10_2 = mp
    L10_2 = L10_2.CLEAN
    return L10_2
  end
  ::lbl_575::
  L10_2 = mp
  L10_2 = L10_2.CLEAN
  return L10_2
end

L2_1 = mp
L2_1 = L2_1.HEADERPAGE_SZ
if L2_1 < 1024 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readu_u32
L3_1 = headerpage
L4_1 = 1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= 561144146 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readu_u16
L3_1 = headerpage
L4_1 = 5
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= 1818 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = headerpage
L2_1 = L2_1[7]
if L2_1 == 1 then
  L2_1 = mp
  L2_1 = L2_1.bitand
  L3_1 = mp
  L3_1 = L3_1.readu_u16
  L4_1 = headerpage
  L5_1 = 13
  L3_1 = L3_1(L4_1, L5_1)
  L4_1 = 255
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = L2_1 + 13
  L3_1 = L3_1 + 1
  L4_1 = 1
  while L4_1 < 2 do
    L5_1 = L3_1 + 4
    L6_1 = mp
    L6_1 = L6_1.HEADERPAGE_SZ
    if not (L5_1 < L6_1) then
      break
    end
    L5_1 = L1_1
    L6_1 = L3_1
    L5_1 = L5_1(L6_1)
    L3_1 = L5_1
    L4_1 = L4_1 + 1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
