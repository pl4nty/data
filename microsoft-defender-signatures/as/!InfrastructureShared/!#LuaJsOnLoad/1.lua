local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 == nil or 20000 < L0_1 or L0_1 < 100 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 0
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = true
L2_1(L3_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "onload=\"([^\"]+)\">"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L3_1 = #L2_1
  if 0 < L3_1 then
    L3_1 = mp
    L3_1 = L3_1.vfo_add_buffer
    L4_1 = L2_1
    L5_1 = "[OnLoadJavaScript]"
    L6_1 = mp
    L6_1 = L6_1.ADD_VFO_TAKE_ACTION_ON_DAD
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "//NScript:JSEnableEmulation"
    L3_1(L4_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
