local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 == L1_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
  L2_1, L3_1 = L2_1(L3_1)
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == "firefox.exe" then
    L2_1 = mp
    L2_1 = L2_1.get_mpattribute
    L3_1 = "SCRIPT:Trojan:JS/Bepush!FB_Script"
    L2_1 = L2_1(L3_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "LUA:Trojan:JS/Bepush!FB_app_fir_scr_web"
      L2_1(L3_1)
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
