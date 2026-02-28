local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = {}
L1_1 = "SCPT:TrojanDownloader:O97M/Encdoc.AVB34!MTB"
L2_1 = "SCPT:TrojanDownloader:PowerShell/Boxter.EA17!MTB"
L3_1 = "SCPT:TrojanDownloader:HTML/Obfuse.PVBA4!MTB"
L4_1 = "SCPT:TrojanDownloader:O97M/Zloader.STO"
L5_1 = "SCPT:Trojan:HTML/ScriptPyExecution.X6"
L6_1 = "SCPT:Trojan:Win32/Malusblnkcmd.A"
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L0_1[5] = L5_1
L0_1[6] = L6_1
L1_1 = 0
L2_1 = pairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = mp
  L7_1 = L7_1.enum_mpattributesubstring
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if L7_1 ~= nil then
    L1_1 = L1_1 + 1
    if 4 <= L1_1 then
      L8_1 = mp
      L8_1 = L8_1.set_mpattribute
      L9_1 = "Lua:PythonObfuscated"
      L8_1(L9_1)
      L8_1 = mp
      L8_1 = L8_1.INFECTED
      return L8_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
