local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 ~= "cscript.exe" and L0_1 ~= "wscript.exe" and L0_1 ~= "mshta.exe" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESS_PPID
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L2_1.image_path
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.match
L5_1 = L3_1
L6_1 = "([^\\]+)$"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
if L0_1 == "wscript.exe" and L4_1 == "onenote.exe" then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:Context/OnenoteDropWscriptLoad"
  L5_1(L6_1)
elseif L0_1 == "cscript.exe" and L4_1 == "onenote.exe" then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:Context/OnenoteDropCscriptLoad"
  L5_1(L6_1)
elseif L0_1 == "mshta.exe" and L4_1 == "onenote.exe" then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:Context/OnenoteDropMshtaLoad"
  L5_1(L6_1)
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
