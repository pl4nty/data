local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.readprotection
L1_1 = false
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 <= 20481 or 131072 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 4096
L3_1 = L0_1 - 4097
L1_1 = L1_1(L2_1, L3_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = true
L3_1(L4_1)
if L2_1 ~= nil and L2_1 ~= "" then
  L3_1 = string
  L3_1 = L3_1.len
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not (L3_1 < 5) then
    goto lbl_41
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_41::
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "%d%d%d+%.png"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:SuspiciousPNGinExcel"
  L3_1(L4_1)
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "please click \"enable content\""
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:SuspiciousEnableContent"
  L3_1(L4_1)
end
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "excel.exe"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:SuspiciousExeinExcel"
  L3_1(L4_1)
end
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "regsvr32.exe"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:SuspiciousRegsvr32inExcel"
  L3_1(L4_1)
end
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "rundll32.exe"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:SuspiciousRundll32inExcel"
  L3_1(L4_1)
end
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "powershell"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:SuspiciousPowerShellCmdinExcel"
  L3_1(L4_1)
end
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "iex"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:SuspiciousPowerShellIEXinExcel"
  L3_1(L4_1)
end
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "curl"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:SuspiciousCRULinExcel"
  L3_1(L4_1)
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "frombase64string"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:SuspiciousB64inExcel.S001"
  L3_1(L4_1)
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "io%.memorystream"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:SuspiciousStreaminExcel.S001"
  L3_1(L4_1)
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "reflection%.assembly"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:SuspiciousReflectioninExcel.S001"
  L3_1(L4_1)
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "new%-object"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:SuspiciousObjectinExcel.S001"
  L3_1(L4_1)
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "h4siaaaa"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:SuspiciousGZB64inExcel.S001"
  L3_1(L4_1)
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "%.org/%w+%.ps"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:SuspiciousPSinExcel"
  L3_1(L4_1)
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "urldownloadtofile"
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L2_1
  L5_1 = "createdirectory"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    goto lbl_225
  end
end
L3_1 = mp
L3_1 = L3_1.set_mpattribute
L4_1 = "Lua:SuspiciousAPIinExcel"
L3_1(L4_1)
::lbl_225::
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "excel 4.0"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Excel40"
  L3_1(L4_1)
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
