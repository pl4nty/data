local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = -4
  L1_1 = L1_1(L2_1, L3_1)
  L3_1 = L0_1
  L2_1 = L0_1.match
  L4_1 = "%->.+/"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L3_1 = L0_1
    L2_1 = L0_1.match
    L4_1 = "%->.+\\"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      L3_1 = L0_1
      L2_1 = L0_1.match
      L4_1 = "%->.+%.cab%->"
      L2_1 = L2_1(L3_1, L4_1)
      if not L2_1 then
        goto lbl_34
      end
    end
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  do return L2_1 end
  ::lbl_34::
  if L1_1 == ".exe" or L1_1 == ".scr" or L1_1 == ".com" then
    L2_1 = {}
    L3_1 = "ALF:Trojan:Win32/"
    L4_1 = "SLF:Trojan:Win32/"
    L5_1 = "Lowfi:HSTR:Win32/"
    L6_1 = "ALF:TrojanSpy:Win32/"
    L7_1 = "ALF:HSTR:Win32/"
    L2_1[1] = L3_1
    L2_1[2] = L4_1
    L2_1[3] = L5_1
    L2_1[4] = L6_1
    L2_1[5] = L7_1
    L3_1 = 0
    L4_1 = pairs
    L5_1 = L2_1
    L4_1, L5_1, L6_1 = L4_1(L5_1)
    for L7_1, L8_1 in L4_1, L5_1, L6_1 do
      L9_1 = mp
      L9_1 = L9_1.enum_mpattributesubstring
      L10_1 = L8_1
      L9_1 = L9_1(L10_1)
      if L9_1 ~= nil then
        L10_1 = type
        L11_1 = L9_1
        L10_1 = L10_1(L11_1)
        if L10_1 == "table" then
          L10_1 = #L9_1
          L3_1 = L3_1 + L10_1
          if 2 <= L3_1 then
            L10_1 = mp
            L10_1 = L10_1.INFECTED
            return L10_1
          end
        end
      end
    end
    L4_1 = {}
    L5_1 = "TEL:Win32/"
    L6_1 = "TELPER:Trojan:Win32/"
    L7_1 = "HSTR:VirTool:Win32/"
    L8_1 = "HSTR:Backdoor:Win32/"
    L9_1 = "HSTR:TrojanDropper:Win32/"
    L10_1 = "HSTR:TrojanDownloader:Win32/"
    L11_1 = "TEL:Trojan:Win32/"
    L12_1 = "HSTR:VirTool:Win32/Obfuscator"
    L13_1 = "LoD:VirTool:Win32/Obfuscator"
    L14_1 = "AGGR:MSIL:GenPossibleCustomObfuscator.A"
    L4_1[1] = L5_1
    L4_1[2] = L6_1
    L4_1[3] = L7_1
    L4_1[4] = L8_1
    L4_1[5] = L9_1
    L4_1[6] = L10_1
    L4_1[7] = L11_1
    L4_1[8] = L12_1
    L4_1[9] = L13_1
    L4_1[10] = L14_1
    L5_1 = 0
    L6_1 = pairs
    L7_1 = L4_1
    L6_1, L7_1, L8_1 = L6_1(L7_1)
    for L9_1, L10_1 in L6_1, L7_1, L8_1 do
      L11_1 = mp
      L11_1 = L11_1.enum_mpattributesubstring
      L12_1 = L10_1
      L11_1 = L11_1(L12_1)
      if L11_1 ~= nil then
        L12_1 = type
        L13_1 = L11_1
        L12_1 = L12_1(L13_1)
        if L12_1 == "table" then
          L12_1 = #L11_1
          L5_1 = L12_1 + L5_1
          if L3_1 == 0 and 5 <= L5_1 then
            L12_1 = mp
            L12_1 = L12_1.INFECTED
            return L12_1
          elseif L3_1 == 1 and 2 <= L5_1 then
            L12_1 = mp
            L12_1 = L12_1.INFECTED
            return L12_1
          end
        end
      end
    end
    L6_1 = {}
    L7_1 = "HSTR:Win32/"
    L8_1 = "HSTR:Trojan:Win32/"
    L6_1[1] = L7_1
    L6_1[2] = L8_1
    L7_1 = 0
    L8_1 = pairs
    L9_1 = L6_1
    L8_1, L9_1, L10_1 = L8_1(L9_1)
    for L11_1, L12_1 in L8_1, L9_1, L10_1 do
      L13_1 = mp
      L13_1 = L13_1.enum_mpattributesubstring
      L14_1 = L12_1
      L13_1 = L13_1(L14_1)
      if L13_1 ~= nil then
        L14_1 = type
        L15_1 = L13_1
        L14_1 = L14_1(L15_1)
        if L14_1 == "table" then
          L14_1 = #L13_1
          L7_1 = L7_1 + L14_1
          if L3_1 == 1 and 2 <= L5_1 and 4 <= L7_1 then
            L14_1 = mp
            L14_1 = L14_1.INFECTED
            return L14_1
          elseif 2 <= L5_1 and 6 <= L7_1 then
            L14_1 = mp
            L14_1 = L14_1.INFECTED
            return L14_1
          else
            L14_1 = L5_1 + L7_1
            if 4 <= L14_1 then
              L14_1 = mp
              L14_1 = L14_1.set_mpattribute
              L15_1 = "Lua:PEEop.B"
              L14_1(L15_1)
            end
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
