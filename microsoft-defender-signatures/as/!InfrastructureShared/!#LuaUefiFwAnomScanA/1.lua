local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 5242880 < L0_1 or L0_1 < 3072 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "NovoSecEngine"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "H19PlatformServiceSmm"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "LSECore"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "CryptRSA"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "AbtAgent"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.enum_mpattributesubstring
L3_1 = "CMN:HSTR:UefiUtils"
L2_1 = L2_1(L3_1)
L3_1 = #L2_1
if 0 < L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = pehdr
L3_1 = L3_1.SizeOfHeaders
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = false
L4_1(L5_1)
L4_1 = mp
L4_1 = L4_1.readfile
L5_1 = pehdr
L5_1 = L5_1.SizeOfHeaders
L6_1 = L0_1 - L3_1
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.readprotection
L6_1 = true
L5_1(L6_1)
L5_1 = false
if L4_1 ~= nil then
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L4_1
  L8_1 = "PE\000\000d\134"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 == nil then
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L4_1
    L8_1 = "PE\000\000L\001"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L6_1 == nil then
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L4_1
      L8_1 = "!This program cannot be run in DOS mode."
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if L6_1 == nil then
        goto lbl_137
      end
    end
  end
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "Lua:UefiFwEmbExe"
  L6_1(L7_1)
  L5_1 = true
  ::lbl_137::
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L4_1
  L8_1 = "\127ELF"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 ~= nil then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:UefiFwEmbElf"
    L6_1(L7_1)
    L5_1 = true
  end
end
if L5_1 == true then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
