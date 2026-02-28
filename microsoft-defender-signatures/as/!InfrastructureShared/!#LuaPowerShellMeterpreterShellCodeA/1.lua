local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1
L0_1 = 0
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:PSDllImportKernel32"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:PSImportVirtualAlloc"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:PSImportCreateThread"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:PSCallWindowsAPI"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:PowerShell/InteropServicesCopy"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:PowerShell/VirtualAlloc"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:PowerShell/CreateThread"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
if L0_1 < 2 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if 1536000 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "Lua:PowerShell/MeterpreterShellCode.A!st"
L2_1(L3_1)
L2_1 = nil
if L1_1 <= 4096 then
  L3_1 = tostring
  L4_1 = headerpage
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
else
  L3_1 = mp
  L3_1 = L3_1.readprotection
  L4_1 = false
  L3_1(L4_1)
  L3_1 = tostring
  L4_1 = mp
  L4_1 = L4_1.readfile
  L5_1 = 0
  L6_1 = L1_1
  L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1 = L4_1(L5_1, L6_1)
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1)
  L2_1 = L3_1
end
if L2_1 ~= nil then
  L4_1 = L2_1
  L3_1 = L2_1.len
  L3_1 = L3_1(L4_1)
  if not (L3_1 < 12) then
    goto lbl_97
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_97::
L3_1 = string
L3_1 = L3_1.gmatch
L4_1 = L2_1
L5_1 = "%[[bB]yte%[%]%].-=.-(0x.-)[\r\n;]"
L3_1 = L3_1(L4_1, L5_1)
L4_1 = 0
L5_1 = L3_1
L6_1 = nil
L7_1 = nil
for L8_1 in L5_1, L6_1, L7_1 do
  if L8_1 ~= nil then
    L9_1 = string
    L9_1 = L9_1.len
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if 5 < L9_1 then
      L9_1 = string
      L9_1 = L9_1.find
      L10_1 = L8_1
      L11_1 = "0x"
      L12_1 = 1
      L13_1 = true
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
      if L9_1 ~= nil then
        L9_1 = string
        L9_1 = L9_1.find
        L10_1 = L8_1
        L11_1 = ","
        L12_1 = 1
        L13_1 = true
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
        if L9_1 ~= nil then
          L9_1 = L8_1
          L11_1 = L9_1
          L10_1 = L9_1.sub
          L12_1 = -1
          L10_1 = L10_1(L11_1, L12_1)
          if L10_1 == ")" then
            L11_1 = L9_1
            L10_1 = L9_1.sub
            L12_1 = 0
            L13_1 = -3
            L10_1 = L10_1(L11_1, L12_1, L13_1)
            L9_1 = L10_1
          end
          L10_1 = L9_1
          L11_1 = ","
          L10_1 = L10_1 .. L11_1
          L11_1 = L10_1
          L10_1 = L10_1.gsub
          L12_1 = "0x([0-9A-Fa-f]+),"
          L13_1 = "0x0%1,"
          L10_1 = L10_1(L11_1, L12_1, L13_1)
          L9_1 = L10_1
          L10_1 = string
          L10_1 = L10_1.gsub
          L11_1 = L9_1
          L12_1 = "%s+"
          L13_1 = ""
          L10_1 = L10_1(L11_1, L12_1, L13_1)
          L9_1 = L10_1
          L10_1 = fastHex2Bin
          L11_1 = L9_1
          L12_1 = "0X[0-9A-Fa-f]-([0-9A-Fa-f][0-9A-Fa-f]),"
          L10_1 = L10_1(L11_1, L12_1)
          L11_1 = mp
          L11_1 = L11_1.vfo_add_buffer
          L12_1 = L10_1
          L13_1 = string
          L13_1 = L13_1.format
          L14_1 = "[PSByteShellcode_%02X]"
          L15_1 = L4_1
          L13_1 = L13_1(L14_1, L15_1)
          L14_1 = mp
          L14_1 = L14_1.ADD_VFO_TAKE_ACTION_ON_DAD
          L11_1(L12_1, L13_1, L14_1)
          L12_1 = L8_1
          L11_1 = L8_1.sub
          L13_1 = 0
          L14_1 = 2
          L11_1 = L11_1(L12_1, L13_1, L14_1)
          if L11_1 ~= "MZ" then
            L11_1 = #L10_1
            if L11_1 <= 8192 then
              L11_1 = "4D5A9000000000000000000050450000"
              L12_1 = "4C010100000000000000000000000000"
              L13_1 = "78000F000B0100000000000000000000"
              L14_1 = "00000000D0000000000000000C000000"
              L15_1 = "00004000000100000001000004000000"
              L16_1 = "01000000040000000000000000300000"
              L17_1 = "C5000000000000000300000000000000"
              L18_1 = "00000000000000000000000000000000"
              L19_1 = "00000000000000000000000000000000"
              L20_1 = "0000000000000000000000002E746578"
              L21_1 = "7400000000200000D000000000200000"
              L22_1 = "D0000000000000000000000000000000"
              L23_1 = "400030E0000000000000000000000000"
              L11_1 = L11_1 .. L12_1 .. L13_1 .. L14_1 .. L15_1 .. L16_1 .. L17_1 .. L18_1 .. L19_1 .. L20_1 .. L21_1 .. L22_1 .. L23_1
              L12_1 = mp
              L12_1 = L12_1.vfo_add_buffer
              L13_1 = fastHex2Bin
              L14_1 = L11_1
              L15_1 = "[0-9A-Fa-f][0-9A-Fa-f]"
              L13_1 = L13_1(L14_1, L15_1)
              L14_1 = L10_1
              L13_1 = L13_1 .. L14_1
              L14_1 = string
              L14_1 = L14_1.format
              L15_1 = "[PSByteShellcodeInPE_%02X]"
              L16_1 = L4_1
              L14_1 = L14_1(L15_1, L16_1)
              L15_1 = mp
              L15_1 = L15_1.ADD_VFO_TAKE_ACTION_ON_DAD
              L12_1(L13_1, L14_1, L15_1)
              L12_1 = "4D5ACEFA504500006486000000000000"
              L13_1 = "000000000000000000002F000B02FAFA"
              L14_1 = "00000000000000000000000008010000"
              L15_1 = "00000000000000000100000004000000"
              L16_1 = "04000000CAFEBABECAFEBABE05000000"
              L17_1 = "00000000000400000801000000000000"
              L18_1 = "02000000CAFEBABE00000000CAFEBABE"
              L19_1 = "00000000CAFEBABE00000000CAFEBABE"
              L20_1 = "00000000000000000000000000000000"
              L21_1 = "00000000000000000000000000000000"
              L22_1 = "00000000000000000000000000000000"
              L23_1 = "00000000000000000000000000000000"
              L24_1 = "00000000000000000000000000000000"
              L25_1 = "00000000000000000000000000000000"
              L26_1 = "00000000000000000000000000000000"
              L27_1 = "00000000000000000000000000000000"
              L28_1 = "0000000000000000"
              L12_1 = L12_1 .. L13_1 .. L14_1 .. L15_1 .. L16_1 .. L17_1 .. L18_1 .. L19_1 .. L20_1 .. L21_1 .. L22_1 .. L23_1 .. L24_1 .. L25_1 .. L26_1 .. L27_1 .. L28_1
              L13_1 = mp
              L13_1 = L13_1.vfo_add_buffer
              L14_1 = fastHex2Bin
              L15_1 = L12_1
              L16_1 = "[0-9A-Fa-f][0-9A-Fa-f]"
              L14_1 = L14_1(L15_1, L16_1)
              L15_1 = L10_1
              L14_1 = L14_1 .. L15_1
              L15_1 = string
              L15_1 = L15_1.format
              L16_1 = "[PSByteShellcodeInPE64_%02X]"
              L17_1 = L4_1
              L15_1 = L15_1(L16_1, L17_1)
              L16_1 = mp
              L16_1 = L16_1.ADD_VFO_TAKE_ACTION_ON_DAD
              L13_1(L14_1, L15_1, L16_1)
            end
          end
          L4_1 = L4_1 + 1
        end
      end
    end
  end
end
if 0 < L4_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.set_mpattribute
L6_1 = "Lua:PowerShell/MeterpreterShellCode.A!noshell"
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
