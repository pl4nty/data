local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 8192 then
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
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = ")))"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = 0
L4_1 = string
L4_1 = L4_1.gmatch
L5_1 = L2_1
L6_1 = "(cg0kdqon)"
L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
for L7_1 in L4_1, L5_1, L6_1 do
  if L7_1 ~= nil then
    L3_1 = L3_1 + 1
  end
end
if 10 < L3_1 then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "Lua:MultipleReturnAtTailerInB64.S001"
  L4_1(L5_1)
end
L4_1 = mp
L4_1 = L4_1.readheader
L5_1 = 0
L6_1 = 4096
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == nil or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = ""
L6_1 = string
L6_1 = L6_1.gmatch
L7_1 = L4_1
L8_1 = "([A-Za-z0-9+/=]+)"
L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
for L9_1 in L6_1, L7_1, L8_1 do
  if L9_1 ~= nil and L9_1 ~= "" then
    L10_1 = string
    L10_1 = L10_1.len
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    if 100 < L10_1 then
      L10_1 = MpCommon
      L10_1 = L10_1.Base64Decode
      L11_1 = L9_1
      L10_1 = L10_1(L11_1)
      L5_1 = L10_1
      if L5_1 ~= nil and L5_1 ~= "" then
        L10_1 = string
        L10_1 = L10_1.lower
        L11_1 = L5_1
        L10_1 = L10_1(L11_1)
        L5_1 = L10_1
        L10_1 = string
        L10_1 = L10_1.match
        L11_1 = L5_1
        L12_1 = "%[byte%[%]%]"
        L10_1 = L10_1(L11_1, L12_1)
        if L10_1 ~= nil and L10_1 ~= "" then
          L11_1 = mp
          L11_1 = L11_1.vfo_add_buffer
          L12_1 = L5_1
          L13_1 = "[ST]"
          L14_1 = mp
          L14_1 = L14_1.ADD_VFO_TAKE_ACTION_ON_DAD
          L11_1(L12_1, L13_1, L14_1)
          L11_1 = mp
          L11_1 = L11_1.set_mpattribute
          L12_1 = "Lua:ShellBytesInB64.S001"
          L11_1(L12_1)
        end
        L11_1 = string
        L11_1 = L11_1.match
        L12_1 = L5_1
        L13_1 = "0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,0x%x%x,"
        L11_1 = L11_1(L12_1, L13_1)
        if L11_1 ~= nil and L11_1 ~= "" then
          L12_1 = mp
          L12_1 = L12_1.set_mpattribute
          L13_1 = "Lua:ShellBytesInB64.S002"
          L12_1(L13_1)
        end
        L12_1 = string
        L12_1 = L12_1.match
        L13_1 = L5_1
        L14_1 = "Invoke"
        L12_1 = L12_1(L13_1, L14_1)
        if L12_1 ~= nil and L12_1 ~= "" then
          L13_1 = mp
          L13_1 = L13_1.set_mpattribute
          L14_1 = "Lua:InvokeInB64.S001"
          L13_1(L14_1)
        end
      end
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
