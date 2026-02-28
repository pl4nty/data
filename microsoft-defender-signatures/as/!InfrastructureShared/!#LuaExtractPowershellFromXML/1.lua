local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 200000 < L0_1 then
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
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = "%z"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L3_1 = L1_1
L2_1 = L1_1.gmatch
L4_1 = "[%w+/]+=?=?"
L2_1 = L2_1(L3_1, L4_1)
L3_1 = L2_1
L4_1 = nil
L5_1 = nil
for L6_1 in L3_1, L4_1, L5_1 do
  L7_1 = #L6_1
  if 80 < L7_1 then
    L7_1 = mp
    L7_1 = L7_1.get_mpattribute
    L8_1 = "BM_SCHEDULEDTASK_JOBFILE"
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L7_1 = mp
      L7_1 = L7_1.set_mpattribute
      L8_1 = "/BM_SCHEDULEDTASK_JOBFILE"
      L7_1(L8_1)
    end
    L7_1 = mp
    L7_1 = L7_1.vfo_add_buffer
    L8_1 = MpCommon
    L8_1 = L8_1.Base64Decode
    L9_1 = L6_1
    L8_1 = L8_1(L9_1)
    L9_1 = "[PwsCode]"
    L10_1 = mp
    L10_1 = L10_1.ADD_VFO_TAKE_ACTION_ON_DAD
    L7_1(L8_1, L9_1, L10_1)
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
