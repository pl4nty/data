local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "."
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 == 1 then
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_PROCESSDEVICEPATH
  L2_1 = L2_1(L3_1)
  if L2_1 ~= nil then
    L3_1 = #L2_1
    if not (L3_1 < 4) then
      goto lbl_47
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  do return L3_1 end
  ::lbl_47::
  if L2_1 == "/var/tmp" or L2_1 == "/tmp" or L2_1 == "/dev/shm" or L2_1 == "/root" or L2_1 == "/home" then
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
  L3_1 = {}
  L4_1 = "/var/tmp/"
  L5_1 = "/tmp/"
  L6_1 = "/dev/shm/"
  L7_1 = "/root/"
  L8_1 = "/home/"
  L3_1[1] = L4_1
  L3_1[2] = L5_1
  L3_1[3] = L6_1
  L3_1[4] = L7_1
  L3_1[5] = L8_1
  L4_1 = ipairs
  L5_1 = L3_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = string
    L9_1 = L9_1.find
    L10_1 = L2_1
    L11_1 = L8_1
    L12_1 = 1
    L13_1 = true
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    if L9_1 == 1 then
      L9_1 = mp
      L9_1 = L9_1.INFECTED
      return L9_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
