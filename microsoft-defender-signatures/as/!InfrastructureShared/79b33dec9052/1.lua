local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
if L1_1 then
  L2_1 = string
  L2_1 = L2_1.gsub
  L3_1 = L1_1
  L4_1 = "\""
  L5_1 = ""
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L1_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.gsub
  L3_1 = L1_1
  L4_1 = "'"
  L5_1 = ""
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L1_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.gsub
  L3_1 = L1_1
  L4_1 = "'+'"
  L5_1 = ""
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L1_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.gsub
  L3_1 = L1_1
  L4_1 = "\"+\""
  L5_1 = ""
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L1_1 = L2_1
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = contains
  L4_1 = L2_1
  L5_1 = {}
  L6_1 = "-bxor"
  L7_1 = "bitsadmin.exe /transfer"
  L8_1 = "::writeallbytes;$"
  L9_1 = "net.webclient"
  L10_1 = "new-object -comobject shell.application).nameSpace"
  L11_1 = "hidden iex"
  L12_1 = "');invoke-webRequest -uri"
  L13_1 = "hidden invoke-expression"
  L14_1 = ".replace( $((pwd)"
  L15_1 = "iex ([system.text.encoding]::UTF8.getstring([convert]::frombase64string"
  L16_1 = "              #"
  L17_1 = "iex(irm "
  L18_1 = "-leaf)); iwr $"
  L19_1 = "[windows.forms.messagebox]::show([string]::concat"
  L20_1 = "join($env:temp"
  L5_1[1] = L6_1
  L5_1[2] = L7_1
  L5_1[3] = L8_1
  L5_1[4] = L9_1
  L5_1[5] = L10_1
  L5_1[6] = L11_1
  L5_1[7] = L12_1
  L5_1[8] = L13_1
  L5_1[9] = L14_1
  L5_1[10] = L15_1
  L5_1[11] = L16_1
  L5_1[12] = L17_1
  L5_1[13] = L18_1
  L5_1[14] = L19_1
  L5_1[15] = L20_1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
