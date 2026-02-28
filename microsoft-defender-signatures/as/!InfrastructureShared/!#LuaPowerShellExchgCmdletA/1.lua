local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_AMSI_CONTENTNAME
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 and L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.sub
  L3_1 = L1_1
  L4_1 = 1
  L5_1 = 12
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if L2_1 == "BodyContent;" then
    L2_1 = nil
    L3_1 = tostring
    L4_1 = headerpage
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    if L2_1 == nil then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L4_1 = L2_1
    L3_1 = L2_1.match
    L5_1 = "<rsp:Command>Get%-Mailbox</rsp:Command><rsp:Arguments>(.*)"
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 ~= nil and L3_1 ~= "" then
      L4_1 = #L3_1
      L4_1 = L4_1 % 4
      if 1 <= L4_1 then
        L4_1 = L3_1
        L5_1 = string
        L5_1 = L5_1.rep
        L6_1 = "="
        L7_1 = #L3_1
        L7_1 = L7_1 % 4
        L7_1 = 4 - L7_1
        L5_1 = L5_1(L6_1, L7_1)
        L3_1 = L4_1 .. L5_1
      end
      L4_1 = MpCommon
      L4_1 = L4_1.Base64Decode
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      L3_1 = L4_1
      L4_1 = mp
      L4_1 = L4_1.vfo_add_buffer
      L5_1 = L3_1
      L6_1 = "[ExchgCmdB64]"
      L7_1 = mp
      L7_1 = L7_1.ADD_VFO_TAKE_ACTION_ON_DAD
      L4_1(L5_1, L6_1, L7_1)
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
