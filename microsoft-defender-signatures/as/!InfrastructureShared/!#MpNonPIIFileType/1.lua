-- Threat: !InfrastructureShared
-- Name: !#MpNonPIIFileType
-- Type: 24
-- MpAttributes: RPF:TopLevelFile & BM_UNKNOWN_FILE

local l_0_0 = {
  "ALFPER:Trojan:Win32/Mscoree.mui!dha",
  "ALFPER:Trojan:Win64/OpenUp.B!dha",
  "ALFPER:VirTool:Win64/Mcgrubber.B!dha",
  "ALFPER:Trojan:Win32/Renofloss.N!dha",
  "ALFPER:Trojan:Win32/KeySnipe.A",
  "ALF:Trojan:Win32/ChocoFrag.B!dha",
  "ALFPER:Trojan:Win32/ChocoFrag.C!dha",
  "ALFPER:Trojan:Win32/Cigril.C!dha",
  "ALFPER:Trojan:Win64/CashLock.C!dha",
  "ALFPER:Trojan:Win32/Cigril.A.enc!dha",
  "ALF:HackTool:Win32/TripWary.E!dha",
  "ALF:HackTool:Win32/Totkpf.B!dha",
  "ALFPER:Trojan:Win64/BackBumper.C!dha",
  "ALF:HackTool:Win32/DeliveryCheck.E!dha",
  "Backdoor:Script/HustleCon.A!dha",
  "ALF:Trojan:Win64/SlickMythTarget.A!dha",
  "ALF:Trojan:Win64/SlickMythTarget.B!dha",
  "ALF:Trojan:Win64/SlickMythTarget.D!dha",
  "ALF:Trojan:Win64/ThumpSlingTarget.A!dha",
  "ALF:Backdoor:Win64/SlickMythTarget.X!dha",
  "ALF:Trojan:Win64/SilentRookTarget.A!dha",
  "ALF:Trojan:Win64/SilentRookTarget.B!dha",
  "ALF:Backdoor:Win64/EchoFitz.B!dha",
  "ALF:Backdoor:Win32/GarbageFile.F!dha",
  "ALF:Backdoor:Win64/NeedyMantis.F!dha",
  "ALF:Trojan:Win64/MutedBallast.D!dha",
  "ALF:Trojan:Win32/RavenDoor.J!dha"
}
for l_0_1, l_0_2 in ipairs(l_0_0) do
  if mp.get_mpattribute(l_0_2) then
    return mp.INFECTED
  end
end
return mp.CLEAN
