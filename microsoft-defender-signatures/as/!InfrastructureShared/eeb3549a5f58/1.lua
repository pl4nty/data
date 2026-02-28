local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = this_sigattrlog
L0_1 = L0_1[4]
L1_1 = L0_1.matched
if L1_1 then
  L1_1 = L0_1.ppid
  if L1_1 then
    L1_1 = L0_1.utf8p2
    if L1_1 then
      goto lbl_15
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
L1_1 = {}
L1_1["Trojan:Win64/Emotet.ZZ!sms"] = true
L1_1["Trojan:Win32/Emotet.ZY!sms"] = true
L1_1["Trojan:Win32/Qakbot.U!sms"] = true
L1_1["TrojanDownloader:Win64/IcedID.ZZ!sms"] = true
L1_1["TrojanDownloader:Win64/IcedID.ZW!sms"] = true
L1_1["TrojanDownloader:Win64/IcedID.ZV!sms"] = true
L1_1["Trojan:Win32/DarkGate.ZZ!sms"] = true
L1_1["Trojan:Win32/DarkGate.ZY!sms"] = true
L1_1["Trojan:Win32/DarkGate.ZX!sms"] = true
L1_1["Trojan:Win32/PikaBot.ZZ!sms"] = true
L1_1["HackTool:Win64/CobaltStrike.I!sms"] = true
L1_1["Trojan:Win64/CobaltStrike.C!sms"] = true
L1_1["HackTool:Win64/CobaltStrike.F!sms"] = true
L1_1["HackTool:Win64/CobaltStrike.G!sms"] = true
L1_1["HackTool:Win64/CobaltStrike.E!sms"] = true
L1_1["VirTool:Win32/CobaltStrike.A"] = true
L1_1["HackTool:Win64/CobaltStrike.K!sms"] = true
L1_1["Trojan:Win64/Qakbot.A!sms"] = true
L1_1["VirTool:Win32/Bruterat.A!sms"] = true
L1_1["Trojan:Win32/Latrodectus.A!sms"] = true
L1_1["Trojan:Win32/SystemBC.SA!sms"] = true
L1_1["Backdoor:Win32/Coroxy.E!sms"] = true
L1_1["Trojan:Win64/Shaolaod.A!sms"] = true
L1_1["Trojan:Win32/Lummac.SD!sms"] = true
L1_1["Trojan:Win32/Lummac.SDA!sms"] = true
L1_1["Trojan:Win32/Lummac.SB!sms"] = true
L1_1["Trojan:Win32/LummaStealer.STB!sms"] = true
L1_1["Trojan:Win32/LummaStealer.STE!sms"] = true
L1_1["Trojan:Win32/LummaStealer.STG!sms"] = true
L1_1["Trojan:Win32/LummaStealer.Z!sms"] = true
L1_1["Trojan:Win32/Zloader.B!sms"] = true
L1_1["Trojan:Win32/Amadey.Y!sms"] = true
L1_1["Trojan:Win64/Amadey.Y!sms"] = true
L1_1["Trojan:Win32/Amadey.Z!sms"] = true
L1_1["Trojan:Win64/Amadey.Z!sms"] = true
L1_1["Trojan:Win32/Amadey.ZZ!sms"] = true
L1_1["Trojan:Win64/Amadey.ZZ!sms"] = true
L1_1["Trojan:Win64/Stealc.ZZ!sms"] = true
L2_1 = L0_1.utf8p2
L2_1 = L1_1[L2_1]
if not L2_1 then
  L2_1 = bm
  L2_1 = L2_1.trigger_sig
  L3_1 = "MaceNonVetted_Sig"
  L4_1 = tostring
  L5_1 = L0_1.utf8p2
  L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1 = L4_1(L5_1)
  L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.format
L3_1 = "DetectedRegions:%s"
L4_1 = L0_1.ppid
L2_1 = L2_1(L3_1, L4_1)
L3_1 = GetRollingQueue
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L4_1 = type
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if L4_1 == "table" then
    goto lbl_86
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_86::
L4_1 = 0
L5_1 = ipairs
L6_1 = L3_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = 32768
  L11_1 = 1
  L12_1 = L9_1.value
  L12_1 = #L12_1
  L13_1 = L10_1
  for L14_1 = L11_1, L12_1, L13_1 do
    L4_1 = L4_1 + 1
    L15_1 = string
    L15_1 = L15_1.format
    L16_1 = "f09d0e89_%d"
    L17_1 = L4_1
    L15_1 = L15_1(L16_1, L17_1)
    L16_1 = string
    L16_1 = L16_1.sub
    L17_1 = L9_1.value
    L18_1 = L14_1
    L19_1 = L14_1 + L10_1
    L19_1 = L19_1 - 1
    L16_1 = L16_1(L17_1, L18_1, L19_1)
    L17_1 = bm
    L17_1 = L17_1.add_related_string
    L18_1 = L15_1
    L19_1 = L16_1
    L20_1 = bm
    L20_1 = L20_1.RelatedStringBMReport
    L17_1(L18_1, L19_1, L20_1)
  end
  if L4_1 == 0 then
    L11_1 = mp
    L11_1 = L11_1.CLEAN
    return L11_1
  end
  L4_1 = L4_1 + 1
  L11_1 = string
  L11_1 = L11_1.format
  L12_1 = "f09d0e89_%d"
  L13_1 = L4_1
  L11_1 = L11_1(L12_1, L13_1)
  L12_1 = bm
  L12_1 = L12_1.add_related_string
  L13_1 = L11_1
  L14_1 = ";"
  L15_1 = bm
  L15_1 = L15_1.RelatedStringBMReport
  L12_1(L13_1, L14_1, L15_1)
end
if L4_1 == 0 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = bm
L5_1 = L5_1.add_related_string
L6_1 = "d9f18702"
L7_1 = L0_1.utf8p2
L8_1 = bm
L8_1 = L8_1.RelatedStringBMReport
L5_1(L6_1, L7_1, L8_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
