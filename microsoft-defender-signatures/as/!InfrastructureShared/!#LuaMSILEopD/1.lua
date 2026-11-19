-- Threat: !InfrastructureShared
-- Name: !#Lua:MSILEop.D
-- Type: 13
-- MpAttributes: pea_ismsil & BM_MZ_FILE & !Exclusion:EOP:MSIL

local l_0_0 = mp.getfilename()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  local l_0_1 = string.sub(l_0_0, -4)
  if string.match(l_0_0, "%->%(part.*%)%->") and (l_0_1 == ".exe" or l_0_1 == ".scr" or l_0_1 == ".com") then
    local l_0_2 = {
      "ALF:Trojan:MSIL/",
      "SLF:Trojan:MSIL/",
      "ALF:JASYP:Trojan:MSIL/",
      "SLF:JASYP:Trojan:MSIL/",
      "ALF:HSTR:MSIL/",
      "SLF:Trojan:Win32/",
      "ALF:HSTR:Trojan:MSIL",
      "Lowfi:HSTR:Win32/AgileDotNetObfuscator",
      "ALF:TrojanDownloader:MSIL",
      "ALF:HackTool:MSIL",
      "SIGATTR:VirTool:MSIL",
      "SLFPER:MSIL",
      "ALF:VirTool:MSIL",
      "Lowfi:HSTR:MSIL/Obfuscator",
      "ALF:Backdoor:MSIL/",
      "AGGR:HSTR:MSIL/PossibleKeylogger",
      "SIGATTR:LoadAssemblyCrypt.A",
      "SIGATTR:LoadAssembly.B"
    }
    local l_0_3 = 0
    for l_0_4, l_0_5 in pairs(l_0_2) do
      local l_0_6 = mp.enum_mpattributesubstring(l_0_5)
      if l_0_6 ~= nil and type(l_0_6) == "table" then
        l_0_3 = l_0_3 + #l_0_6
        if 2 <= l_0_3 then
          return mp.INFECTED
        end
      end
    end
    local l_0_7 = {
      "HSTR:Trojan:MSIL",
      "Packed:Confuser",
      "SIGATTR:MSIL",
      "SIGATTR:Trojan:MSIL",
      "TEL:Backdoor:MSIL/",
      "Lowfi:HSTR:Win32",
      "Trojan:MSIL/AgentTesla",
      "HSTR:DESCryptoServiceProvider.A",
      "TEL:VirTool:MSIL/Obfuscator",
      "AGGR:MSIL:GenPossibleCustomObfuscator.A",
      "Lua:MSIL.AbnormalMethod.Name",
      "Trojan:Win32/AutoitInject",
      "HSTR:VirTool:Win32/Obfuscator",
      "LoD:VirTool:Win32/Obfuscator",
      "HSTR:Crypto.A",
      "Lua:Win32/Packed",
      "LUA:PEAnomaly_CertificateExpired",
      "SIGATTR:LoadAssembly.A",
      "ALF:Trojan:Win32",
      "TEL:Trojan:MSIL/",
      "SIGATTR:Cypto.A",
      "SIGATTR:LoadAssemblyCrypt.A",
      "Trojan:MSIL/NanoCore",
      "Trojan:MSIL/FormBook",
      "SIGATTR:DisableAMSI",
      "Lowfi:HSTR:MSIL/Obfuscator.DotNETReactor.B"
    }
    local l_0_8 = 0
    for l_0_9, l_0_10 in pairs(l_0_7) do
      local l_0_11 = mp.enum_mpattributesubstring(l_0_10)
      if l_0_11 ~= nil and type(l_0_11) == "table" then
        l_0_8 = #l_0_11 + l_0_8
        if l_0_3 == 0 and 3 <= l_0_8 then
          return mp.INFECTED
        elseif l_0_3 == 1 and 2 <= l_0_8 then
          return mp.INFECTED
        end
      end
    end
    local l_0_12 = {"HSTR:MSIL/"}
    for l_0_13, l_0_14 in pairs(l_0_12) do
      local l_0_15 = mp.enum_mpattributesubstring(l_0_14)
      if l_0_15 ~= nil and type(l_0_15) == "table" then
        l_0_8 = #l_0_15 + l_0_8
        if l_0_3 == 0 and 4 <= l_0_8 then
          return mp.INFECTED
        elseif l_0_3 == 1 and 3 <= l_0_8 then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
