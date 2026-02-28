local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = {}
L1_1 = "ALFPER:Trojan:Win32/Mscoree.mui!dha"
L2_1 = "ALFPER:Trojan:Win64/OpenUp.B!dha"
L3_1 = "ALFPER:VirTool:Win64/Mcgrubber.B!dha"
L4_1 = "ALFPER:Trojan:Win32/Renofloss.N!dha"
L5_1 = "ALFPER:Trojan:Win32/KeySnipe.A"
L6_1 = "ALF:Trojan:Win32/ChocoFrag.B!dha"
L7_1 = "ALFPER:Trojan:Win32/ChocoFrag.C!dha"
L8_1 = "ALFPER:Trojan:Win32/Cigril.C!dha"
L9_1 = "ALFPER:Trojan:Win64/CashLock.C!dha"
L10_1 = "ALFPER:Trojan:Win32/Cigril.A.enc!dha"
L11_1 = "ALF:HackTool:Win32/TripWary.E!dha"
L12_1 = "ALF:HackTool:Win32/Totkpf.B!dha"
L13_1 = "ALFPER:Trojan:Win64/BackBumper.C!dha"
L14_1 = "ALF:HackTool:Win32/DeliveryCheck.E!dha"
L15_1 = "Backdoor:Script/HustleCon.A!dha"
L16_1 = "ALF:Trojan:Win64/SlickMythTarget.A!dha"
L17_1 = "ALF:Trojan:Win64/SlickMythTarget.B!dha"
L18_1 = "ALF:Trojan:Win64/SlickMythTarget.D!dha"
L19_1 = "ALF:Trojan:Win64/ThumpSlingTarget.A!dha"
L20_1 = "ALF:Backdoor:Win64/SlickMythTarget.X!dha"
L21_1 = "ALF:Trojan:Win64/SilentRookTarget.A!dha"
L22_1 = "ALF:Trojan:Win64/SilentRookTarget.B!dha"
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L0_1[5] = L5_1
L0_1[6] = L6_1
L0_1[7] = L7_1
L0_1[8] = L8_1
L0_1[9] = L9_1
L0_1[10] = L10_1
L0_1[11] = L11_1
L0_1[12] = L12_1
L0_1[13] = L13_1
L0_1[14] = L14_1
L0_1[15] = L15_1
L0_1[16] = L16_1
L0_1[17] = L17_1
L0_1[18] = L18_1
L0_1[19] = L19_1
L0_1[20] = L20_1
L0_1[21] = L21_1
L0_1[22] = L22_1
L1_1 = ipairs
L2_1 = L0_1
L1_1, L2_1, L3_1 = L1_1(L2_1)
for L4_1, L5_1 in L1_1, L2_1, L3_1 do
  L6_1 = mp
  L6_1 = L6_1.get_mpattribute
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
