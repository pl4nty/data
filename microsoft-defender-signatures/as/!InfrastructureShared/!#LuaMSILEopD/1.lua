local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1
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
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L0_1
  L4_1 = "%->%(part.*%)%->"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 and (L1_1 == ".exe" or L1_1 == ".scr" or L1_1 == ".com") then
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
    L18_1 = "AGGR:HSTR:MSIL/PossibleKeylogger"
    L19_1 = "SIGATTR:LoadAssemblyCrypt.A"
    L20_1 = "SIGATTR:LoadAssembly.B"
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
    L2_1[16] = L18_1
    L2_1[17] = L19_1
    L2_1[18] = L20_1
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
    L7_1 = "SIGATTR:MSIL"
    L8_1 = "SIGATTR:Trojan:MSIL"
    L9_1 = "TEL:Backdoor:MSIL/"
    L10_1 = "Lowfi:HSTR:Win32"
    L11_1 = "Trojan:MSIL/AgentTesla"
    L12_1 = "HSTR:DESCryptoServiceProvider.A"
    L13_1 = "TEL:VirTool:MSIL/Obfuscator"
    L14_1 = "AGGR:MSIL:GenPossibleCustomObfuscator.A"
    L15_1 = "Lua:MSIL.AbnormalMethod.Name"
    L16_1 = "Trojan:Win32/AutoitInject"
    L17_1 = "HSTR:VirTool:Win32/Obfuscator"
    L18_1 = "LoD:VirTool:Win32/Obfuscator"
    L19_1 = "HSTR:Crypto.A"
    L20_1 = "Lua:Win32/Packed"
    L21_1 = "LUA:PEAnomaly_CertificateExpired"
    L22_1 = "SIGATTR:LoadAssembly.A"
    L23_1 = "ALF:Trojan:Win32"
    L24_1 = "TEL:Trojan:MSIL/"
    L25_1 = "SIGATTR:Cypto.A"
    L26_1 = "SIGATTR:LoadAssemblyCrypt.A"
    L27_1 = "Trojan:MSIL/NanoCore"
    L28_1 = "Trojan:MSIL/FormBook"
    L29_1 = "SIGATTR:DisableAMSI"
    L30_1 = "Lowfi:HSTR:MSIL/Obfuscator.DotNETReactor.B"
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
    L4_1[12] = L16_1
    L4_1[13] = L17_1
    L4_1[14] = L18_1
    L4_1[15] = L19_1
    L4_1[16] = L20_1
    L4_1[17] = L21_1
    L4_1[18] = L22_1
    L4_1[19] = L23_1
    L4_1[20] = L24_1
    L4_1[21] = L25_1
    L4_1[22] = L26_1
    L4_1[23] = L27_1
    L4_1[24] = L28_1
    L4_1[25] = L29_1
    L4_1[26] = L30_1
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
    L6_1 = {}
    L7_1 = "HSTR:MSIL/"
    L6_1[1] = L7_1
    L7_1 = pairs
    L8_1 = L6_1
    L7_1, L8_1, L9_1 = L7_1(L8_1)
    for L10_1, L11_1 in L7_1, L8_1, L9_1 do
      L12_1 = mp
      L12_1 = L12_1.enum_mpattributesubstring
      L13_1 = L11_1
      L12_1 = L12_1(L13_1)
      if L12_1 ~= nil then
        L13_1 = type
        L14_1 = L12_1
        L13_1 = L13_1(L14_1)
        if L13_1 == "table" then
          L13_1 = #L12_1
          L5_1 = L13_1 + L5_1
          if L3_1 == 0 and 4 <= L5_1 then
            L13_1 = mp
            L13_1 = L13_1.INFECTED
            return L13_1
          elseif L3_1 == 1 and 3 <= L5_1 then
            L13_1 = mp
            L13_1 = L13_1.INFECTED
            return L13_1
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
