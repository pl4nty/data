local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = ""
  if L1_1 then
    goto lbl_34
  end
end
L1_1 = L0_1
::lbl_34::
L2_1 = L1_1
L1_1 = L1_1.lower
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 ~= "svchost.exe" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESS_PPID
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = ""
  if L3_1 then
    goto lbl_57
  end
end
L3_1 = L2_1
::lbl_57::
L4_1 = L3_1
L3_1 = L3_1.lower
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "-s%s+([^%s]+)"
L3_1 = L3_1(L4_1, L5_1)
L4_1 = string
L4_1 = L4_1.match
L5_1 = L2_1
L6_1 = "-k%s+([^%s]+)"
L4_1 = L4_1(L5_1, L6_1)
if L3_1 ~= nil then
  L6_1 = L3_1
  L5_1 = L3_1.len
  L5_1 = L5_1(L6_1)
  if L5_1 < 100 then
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "Lua:ContextSvchostDropFromService:"
    L7_1 = L3_1
    L6_1 = L6_1 .. L7_1
    L5_1(L6_1)
end
else
  if L4_1 ~= nil then
    L6_1 = L4_1
    L5_1 = L4_1.len
    L5_1 = L5_1(L6_1)
    if L5_1 < 100 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:ContextSvchostDropFromService:"
      L7_1 = L4_1
      L6_1 = L6_1 .. L7_1
      L5_1(L6_1)
  end
  else
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "Lua:ContextSvchostDropFromService"
    L5_1(L6_1)
  end
end
L5_1 = mp
L5_1 = L5_1.getfilename
L5_1 = L5_1()
L6_1 = mp
L6_1 = L6_1.IsKnownFriendlyFile
L7_1 = L5_1
L8_1 = true
L9_1 = false
L6_1 = L6_1(L7_1, L8_1, L9_1)
if not L6_1 and L3_1 ~= nil and L3_1 == "winhttpautoproxysvc" then
  L6_1 = mp
  L6_1 = L6_1.ReportLowfi
  L7_1 = L5_1
  L8_1 = 5866790093402
  L6_1(L7_1, L8_1)
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
