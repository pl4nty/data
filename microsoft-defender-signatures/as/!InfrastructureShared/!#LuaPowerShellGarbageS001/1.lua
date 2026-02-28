local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 65536 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfooter
L2_1 = 3328
L3_1 = 768
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = tostring
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "if %(%-?%d%d%d%d+ %-ge %-?%d%d%d%d+%) %{"
L3_1 = L3_1(L4_1, L5_1)
L4_1 = string
L4_1 = L4_1.match
L5_1 = L2_1
L6_1 = "if %(%-?%d%d%d%d+ %-le %-?%d%d%d%d+%) %{"
L4_1 = L4_1(L5_1, L6_1)
L5_1 = string
L5_1 = L5_1.match
L6_1 = L2_1
L7_1 = "if %(%-?%d%d%d%d+ %-lt %-?%d%d%d%d+%) %{"
L5_1 = L5_1(L6_1, L7_1)
L6_1 = string
L6_1 = L6_1.match
L7_1 = L2_1
L8_1 = "if %(%-?%d%d%d%d+ %-gt %-?%d%d%d%d+%) %{"
L6_1 = L6_1(L7_1, L8_1)
L7_1 = string
L7_1 = L7_1.match
L8_1 = L2_1
L9_1 = "if %(%-?%d%d%d%d+ %-eq %-?%d%d%d%d+%) %{"
L7_1 = L7_1(L8_1, L9_1)
L8_1 = string
L8_1 = L8_1.match
L9_1 = L2_1
L10_1 = "if %(%-?%d%d%d%d+ %-ne %-?%d%d%d%d+%) %{"
L8_1 = L8_1(L9_1, L10_1)
if L3_1 ~= nil and L3_1 ~= "" then
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:PowerShell.Garbage.S001"
  L9_1(L10_1)
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
if L4_1 ~= nil and L4_1 ~= "" then
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:PowerShell.Garbage.S001"
  L9_1(L10_1)
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
if L5_1 ~= nil and L5_1 ~= "" then
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:PowerShell.Garbage.S001"
  L9_1(L10_1)
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
if L6_1 ~= nil and L6_1 ~= "" then
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:PowerShell.Garbage.S001"
  L9_1(L10_1)
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
if L7_1 ~= nil and L7_1 ~= "" then
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:PowerShell.Garbage.S001"
  L9_1(L10_1)
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
if L8_1 ~= nil and L8_1 ~= "" then
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:PowerShell.Garbage.S001"
  L9_1(L10_1)
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
