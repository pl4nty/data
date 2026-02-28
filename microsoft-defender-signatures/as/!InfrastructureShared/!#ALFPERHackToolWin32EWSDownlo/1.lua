local L0_1, L1_1, L2_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = {}
  L1_1["IGOR_UI.exe"] = ""
  L1_1["IGOR_Core.dll"] = ""
  L1_1["IGOR.Interface.CLI.exe"] = ""
  L2_1 = L0_1.OriginalFilename
  L2_1 = L1_1[L2_1]
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
