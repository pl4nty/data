local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 256 or 4096 < L0_1 then
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
L3_1 = 5
L1_1 = L1_1(L2_1, L3_1)
L2_1 = tostring
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "U\139\236\129\236"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.set_mpattribute
L4_1 = "Lua:ShellCodeBinaryFileFound.S001"
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.readfile
L4_1 = 0
L5_1 = 256
L3_1 = L3_1(L4_1, L5_1)
L4_1 = tostring
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = "d\1610\000\000\000\139@\f\139@\f\139\000\139\000\139@\024\139\248"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:GetKernel32DllBase.S001"
  L5_1(L6_1)
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = "\186\2555S\019\139\207\232"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:GetReadFileFromHash.S001"
  L5_1(L6_1)
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = "\186\003\022\159\156\139\207\232"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:GetReadFileFromHash.S001"
  L5_1(L6_1)
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = "\186f}vW\139\207\137E"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:GetVirtuallFromHash.S001"
  L5_1(L6_1)
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = "\186\234]>\n\139\207\137E"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:GetVirtuallFromHash.S001"
  L5_1(L6_1)
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = "\253\255\255P\255\214j\000h\128\000\000\000j\003j\000j\ah\000\000\000\128\141\133"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:SuspicousShellCodeDataFile.S001"
  L5_1(L6_1)
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = "P\255\2143\255Wh\128\000\000\000j\003Wj\ah\000\000\000\128\141\133"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:SuspicousShellCodeDataFile.S001"
  L5_1(L6_1)
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = "\186\003\022\159\156\139\207\232\202\000\000\000\186L\2009n\139\207\137E\212\232\187\000\000\000\186\244\181{\f\139\207\139\240\232\173\000\000\000\186\234]>\n"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:APIinMalicious.S001"
  L5_1(L6_1)
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
