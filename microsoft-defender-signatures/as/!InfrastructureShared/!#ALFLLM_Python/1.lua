local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "cnt:pyt:llm_import"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = #L0_1
  if L1_1 ~= 0 then
    goto lbl_13
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_13::
L1_1 = table_dedup
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = set_research_data
L2_1 = "pyt_llm_attribs"
L3_1 = table
L3_1 = L3_1.concat
L4_1 = L0_1
L5_1 = "|"
L3_1 = L3_1(L4_1, L5_1)
L4_1 = false
L1_1(L2_1, L3_1, L4_1)
L1_1 = false
L2_1 = mp
L2_1 = L2_1.enum_mpattributesubstring
L3_1 = "cnt:llm:network"
L2_1 = L2_1(L3_1)
if L2_1 then
  L3_1 = #L2_1
  if 0 < L3_1 then
    L3_1 = table_dedup
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    L3_1 = set_research_data
    L4_1 = "llm_attribs_net"
    L5_1 = table
    L5_1 = L5_1.concat
    L6_1 = L2_1
    L7_1 = "|"
    L5_1 = L5_1(L6_1, L7_1)
    L6_1 = false
    L3_1(L4_1, L5_1, L6_1)
    L1_1 = true
  end
end
L3_1 = tostring
L4_1 = headerpage
L3_1 = L3_1(L4_1)
L4_1 = tostring
L5_1 = footerpage
L4_1 = L4_1(L5_1)
L3_1 = L3_1 .. L4_1
L4_1 = mp
L4_1 = L4_1.enum_mpattributesubstring
L5_1 = "cnt:pyt:execute"
L4_1 = L4_1(L5_1)
if L4_1 then
  L5_1 = #L4_1
  if 0 < L5_1 then
    L5_1 = MpCommon
    L5_1 = L5_1.StringRegExpSearch
    L6_1 = "(subprocess\\.run\\(.*?\\)|create_subprocess_exec\\(.*?\\))"
    L7_1 = L3_1
    L5_1, L6_1 = L5_1(L6_1, L7_1)
    if L5_1 then
      L7_1 = MpCommon
      L7_1 = L7_1.StringRegExpSearch
      L8_1 = "\\(\\[?['\""
      L9_1 = L6_1
      L7_1 = L7_1(L8_1, L9_1)
      if not L7_1 then
        L7_1 = set_research_data
        L8_1 = "exec_attrib_matched"
        L9_1 = L6_1
        L10_1 = false
        L7_1(L8_1, L9_1, L10_1)
        L1_1 = true
      end
    end
  end
end
L5_1 = "(?i)(\\s(Ignore|Disregard|Skip|Forget|Neglect|Overlook|Omit|Bypass|Pay no attention to|Do not follow|Do not obey)\\s(any|all|prior|previous|preceding|above|foregoing|earlier|initial)\\s(content|text|instructions|instruction|directives|directive|commands|command|context|conversation|input|inputs|data|message|messages|communication|response|responses|request|requests))"
L6_1 = MpCommon
L6_1 = L6_1.StringRegExpSearch
L7_1 = L5_1
L8_1 = L3_1
L6_1, L7_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L8_1 = set_research_data
  L9_1 = "jailbrk_indicator"
  L10_1 = L7_1
  L11_1 = false
  L8_1(L9_1, L10_1, L11_1)
  L1_1 = true
end
L8_1 = mp
L8_1 = L8_1.enum_mpattributesubstring
L9_1 = "cnt:llm:suspicious_arg"
L8_1 = L8_1(L9_1)
if L8_1 then
  L9_1 = #L8_1
  if 0 < L9_1 then
    L9_1 = set_research_data
    L10_1 = "llm_susp_args"
    L11_1 = table
    L11_1 = L11_1.concat
    L12_1 = L8_1
    L13_1 = "|"
    L11_1 = L11_1(L12_1, L13_1)
    L12_1 = false
    L9_1(L10_1, L11_1, L12_1)
    L1_1 = true
  end
end
if L1_1 then
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
