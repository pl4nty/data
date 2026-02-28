local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_mpattributesubstring
L2_1 = "PACKED_WITH:"
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "ScriptObfuseScore"
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.HEADERPAGE_SZ
if L1_1 < 1024 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = 0
L2_1 = 0
L3_1 = 0
L4_1 = 0
L5_1 = 0
L6_1 = 0
L7_1 = 0
L8_1 = tostring
L9_1 = headerpage
L8_1 = L8_1(L9_1)
L9_1 = L8_1
L8_1 = L8_1.lower
L8_1 = L8_1(L9_1)
L9_1 = string
L9_1 = L9_1.gsub
L10_1 = L8_1
L11_1 = "'%+'"
L12_1 = ""
L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1)
L2_1 = L10_1
L8_1 = L9_1
L9_1 = string
L9_1 = L9_1.gsub
L10_1 = L8_1
L11_1 = "\"%+\""
L12_1 = ""
L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1)
L3_1 = L10_1
L8_1 = L9_1
L9_1 = string
L9_1 = L9_1.gsub
L10_1 = L8_1
L11_1 = "'%)%+%('"
L12_1 = ""
L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1)
L4_1 = L10_1
L8_1 = L9_1
L9_1 = string
L9_1 = L9_1.gsub
L10_1 = L8_1
L11_1 = "\"%)%+%(\""
L12_1 = ""
L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1)
L5_1 = L10_1
L8_1 = L9_1
L9_1 = string
L9_1 = L9_1.gsub
L10_1 = L8_1
L11_1 = "`"
L12_1 = ""
L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1)
L6_1 = L10_1
L8_1 = L9_1
L9_1 = string
L9_1 = L9_1.gsub
L10_1 = L8_1
L11_1 = "\"\""
L12_1 = ""
L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1)
L7_1 = L10_1
L8_1 = L9_1
L9_1 = L2_1 + L3_1
L9_1 = L9_1 + L4_1
L9_1 = L9_1 + L5_1
L9_1 = L9_1 + L6_1
L1_1 = L9_1 + L7_1
L9_1 = mp
L9_1 = L9_1.set_mpattributeex
L10_1 = "//ScriptObfuseScore"
L11_1 = L1_1
L9_1(L10_1, L11_1)
if 500 <= L1_1 then
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:HighScriptObfuseScore500"
  L9_1(L10_1)
elseif 400 < L1_1 then
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:HighScriptObfuseScore400"
  L9_1(L10_1)
elseif 300 <= L1_1 then
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:HighScriptObfuseScore300"
  L9_1(L10_1)
elseif 100 <= L1_1 then
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:HighScriptObfuseScore100"
  L9_1(L10_1)
elseif 50 <= L1_1 then
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:HighScriptObfuseScore50"
  L9_1(L10_1)
end
if 20 < L1_1 then
  L9_1 = mp
  L9_1 = L9_1.vfo_add_buffer
  L10_1 = L8_1
  L11_1 = "[SCRIPTAMSIDecoded]"
  L12_1 = mp
  L12_1 = L12_1.ADD_VFO_TAKE_ACTION_ON_DAD
  L9_1(L10_1, L11_1, L12_1)
end
L9_1 = mp
L9_1 = L9_1.INFECTED
return L9_1
