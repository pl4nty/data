local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_FULL
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 5) then
    goto lbl_14
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_14::
L1_1 = mp
L1_1 = L1_1.GetCertificateInfo
L1_1 = L1_1()
L2_1 = #L1_1
if 0 < L2_1 and L1_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = hstrlog
L2_1 = L2_1[2]
L2_1 = L2_1.hitcount
if L2_1 < 3 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = hstrlog
L3_1 = L3_1[1]
L3_1 = L3_1.location
L4_1 = hstrlog
L4_1 = L4_1[5]
L4_1 = L4_1.location
if L4_1 ~= nil and L4_1 ~= 0 and L3_1 ~= nil and L3_1 ~= 0 then
  L5_1 = machoLC
  if L5_1 ~= nil then
    L5_1 = machoLC
    L5_1 = L5_1.__TEXT
    if L5_1 ~= nil then
      L5_1 = machoLC
      L5_1 = L5_1.__TEXT
      L5_1 = L5_1.__const
      if L5_1 ~= nil then
        L5_1 = machoLC
        L5_1 = L5_1.__TEXT
        L5_1 = L5_1.__const
        if L5_1 ~= "" then
          goto lbl_67
        end
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_67::
L5_1 = machoLC
L5_1 = L5_1.__TEXT
L5_1 = L5_1.__const
L5_1 = L5_1.Size
L6_1 = machoLC
L6_1 = L6_1.__TEXT
L6_1 = L6_1.__const
L6_1 = L6_1.Offset
if L5_1 == nil or L6_1 == nil or L5_1 == 0 or L6_1 == 0 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
if L3_1 >= L6_1 then
  L7_1 = L6_1 + L5_1
  if L3_1 <= L7_1 and L4_1 >= L6_1 then
    L7_1 = L6_1 + L5_1
    if L4_1 <= L7_1 then
      L7_1 = mp
      L7_1 = L7_1.get_contextdata
      L8_1 = mp
      L8_1 = L8_1.CONTEXT_DATA_PROCESS_PPID
      L7_1 = L7_1(L8_1)
      if L7_1 then
        L8_1 = MpCommon
        L8_1 = L8_1.BmTriggerSig
        L9_1 = L7_1
        L10_1 = "BM_SuspRevShellEmbedded"
        L11_1 = L0_1
        L8_1(L9_1, L10_1, L11_1)
      end
      L8_1 = mp
      L8_1 = L8_1.INFECTED
      return L8_1
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
