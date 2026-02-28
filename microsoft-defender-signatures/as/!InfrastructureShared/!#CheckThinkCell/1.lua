local L0_1, L1_1, L2_1, L3_1, L4_1
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
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.FileDescription
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L0_1.ProductName
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
if L1_1 == "think-cell component" and L2_1 == "think-cell" then
  L3_1 = mp
  L3_1 = L3_1.IsTrustedFile
  L4_1 = false
  L3_1 = L3_1(L4_1)
  if L3_1 == true then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:ValidSignedThinkCellComponent"
    L3_1(L4_1)
  else
    L3_1 = mp
    L3_1 = L3_1.get_mpattribute
    L4_1 = "PEPCODE:HasDigitalSignature"
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.set_mpattribute
      L4_1 = "Lua:SignedThinkCellComponent"
      L3_1(L4_1)
    else
      L3_1 = mp
      L3_1 = L3_1.set_mpattribute
      L4_1 = "Lua:UnSignedThinkCellComponent"
      L3_1(L4_1)
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
