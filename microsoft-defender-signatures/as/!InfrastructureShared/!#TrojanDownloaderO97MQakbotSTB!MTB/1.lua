local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 16384 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.len
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not (L2_1 < 14) then
  L2_1 = string
  L2_1 = L2_1.len
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not (100 < L2_1) then
    goto lbl_39
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_39::
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "vbaproject.bin"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = tostring
L3_1 = mp
L3_1 = L3_1.readfile
L4_1 = L0_1 - 4096
L5_1 = 3840
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if L2_1 == nil then
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
L5_1 = "name=\"vbaproject\""
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "excel4intlmacrosheets"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 ~= nil then
    goto lbl_93
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_93::
L3_1 = mp
L3_1 = L3_1.set_mpattribute
L4_1 = "Lua:vbaproject.s001"
L3_1(L4_1)
L3_1 = tostring
L4_1 = mp
L4_1 = L4_1.readfile
L5_1 = 8192
L6_1 = 7936
L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "regsvr32"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= nil then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "Lua:ExcelSusp.Regsvr32.S001"
  L4_1(L5_1)
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "regsvr32 -s"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 == nil then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "regsvr32.exe -s"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 == nil then
      goto lbl_149
    end
  end
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "Lua:ExcelSusp.Regsvr32Si.S001"
  L4_1(L5_1)
end
::lbl_149::
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "celod.wac"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= nil then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "Lua:ExcelQakbotDrop.S001"
  L4_1(L5_1)
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "..\\celod.wac"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 ~= nil then
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "Lua:ExcelQakbotDrop.S002"
    L4_1(L5_1)
  end
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "caption         =   \"urldownloadtofilea\""
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= nil then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "Lua:ExcelSusp.Urld.S001"
  L4_1(L5_1)
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "c:\\users\\test\\appdata\\local\\temp\\vbe\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 == nil then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "c:\\users\\user\\appdata\\local\\temp\\vbe\\"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 == nil then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "c:\\users\\doc\\appdata\\local\\temp\\vbe\\"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 == nil then
      goto lbl_219
    end
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "Lua:ExcelSusp.User.S001"
L4_1(L5_1)
::lbl_219::
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "/190."
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 == nil then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "/188."
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 == nil then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "/185."
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 == nil then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L3_1
      L6_1 = "/94."
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if L4_1 == nil then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L3_1
        L6_1 = "/5."
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if L4_1 == nil then
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L3_1
          L6_1 = "/84."
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if L4_1 == nil then
            L4_1 = string
            L4_1 = L4_1.find
            L5_1 = L3_1
            L6_1 = "/194."
            L7_1 = 1
            L8_1 = true
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if L4_1 == nil then
              L4_1 = string
              L4_1 = L4_1.find
              L5_1 = L3_1
              L6_1 = "/23."
              L7_1 = 1
              L8_1 = true
              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
              if L4_1 == nil then
                L4_1 = string
                L4_1 = L4_1.find
                L5_1 = L3_1
                L6_1 = "/101."
                L7_1 = 1
                L8_1 = true
                L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                if L4_1 == nil then
                  goto lbl_304
                end
              end
            end
          end
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "Lua:ExcelSuspicious.Ip.S001"
L4_1(L5_1)
::lbl_304::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
