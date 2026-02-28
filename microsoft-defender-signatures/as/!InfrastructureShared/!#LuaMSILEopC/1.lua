local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
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
    L3_1 = "ALF:Trojan:MSIL/"
    L4_1 = "SLF:Trojan:MSIL/"
    L5_1 = "ALF:JASYP:Trojan:MSIL/"
    L6_1 = "SLF:JASYP:Trojan:MSIL/"
    L7_1 = "ALF:HSTR:MSIL/"
    L8_1 = "SLF:Trojan:Win32/"
    L9_1 = "ALF:HSTR:Trojan:MSIL"
    L10_1 = "Lowfi:HSTR:Win32/AgileDotNetObfuscator"
    L11_1 = "ALF:TrojanDownloader:MSIL"
    L12_1 = "ALF:HackTool:MSIL"
    L13_1 = "SIGATTR:VirTool:MSIL"
    L14_1 = "SLFPER:MSIL"
    L15_1 = "ALF:VirTool:MSIL"
    L16_1 = "Lowfi:HSTR:MSIL/Obfuscator"
    L17_1 = "ALF:Backdoor:MSIL/"
    L2_1[1] = L3_1
    L2_1[2] = L4_1
    L2_1[3] = L5_1
    L2_1[4] = L6_1
    L2_1[5] = L7_1
    L2_1[6] = L8_1
    L2_1[7] = L9_1
    L2_1[8] = L10_1
    L2_1[9] = L11_1
    L2_1[10] = L12_1
    L2_1[11] = L13_1
    L2_1[12] = L14_1
    L2_1[13] = L15_1
    L2_1[14] = L16_1
    L2_1[15] = L17_1
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
    L5_1 = "HSTR:Trojan:MSIL"
    L6_1 = "Packed:Confuser"
    L7_1 = "HSTR:MSIL/"
    L8_1 = "SIGATTR:MSIL"
    L9_1 = "SIGATTR:Trojan:MSIL"
    L10_1 = "TEL:Backdoor:MSIL/"
    L11_1 = "Lowfi:HSTR:Win32"
    L12_1 = "Trojan:MSIL/AgentTesla"
    L13_1 = "HSTR:DESCryptoServiceProvider.A"
    L14_1 = "LUA:PEAnomaly_CertificateExpired"
    L15_1 = "Lowfi:HSTR:MSIL/Obfuscator.DotNETReactor.B"
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
    L4_1[11] = L15_1
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
          if L3_1 == 0 and 3 <= L5_1 then
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
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
