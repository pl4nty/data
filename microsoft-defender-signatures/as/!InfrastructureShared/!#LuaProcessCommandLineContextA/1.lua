local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONOPEN
  if L0_1 == L1_1 then
    goto lbl_19
  end
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 == L1_1 then
    goto lbl_19
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_19::
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 4) then
    L2_1 = #L1_1
    if not (50 < L2_1) then
      goto lbl_35
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_35::
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 == "powershell.exe" then
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_PROCESS_PPID
  L2_1 = L2_1(L3_1)
  if L2_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = mp
  L3_1 = L3_1.GetProcessCommandLine
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 == nil then
    L4_1 = #L3_1
    if L4_1 <= 5 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
  end
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = string
  L5_1 = L5_1.gsub
  L6_1 = L3_1
  L7_1 = " "
  L8_1 = ""
  L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L5_1(L6_1, L7_1, L8_1)
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
  L5_1 = "Lua:ProcCmdLineContext.A!"
  L6_1 = #L4_1
  if 100 < L6_1 then
    L6_1 = #L4_1
    if L6_1 < 350 then
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L4_1
      L8_1 = "-command\"if(get-command'get-windowsfeature'-erroractionsilentlycontinue){get-windowsfeature-nameweb-server|convertto-json|out-file"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if L6_1 ~= nil then
        L6_1 = L5_1
        L7_1 = "PsAzureArc"
        L6_1 = L6_1 .. L7_1
        L7_1 = mp
        L7_1 = L7_1.set_mpattribute
        L8_1 = L6_1
        L7_1(L8_1)
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
