local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = mp
L0_1 = L0_1.get_parent_filehandle
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.is_handle_nil
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILEPATH
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 23) then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "\\users\\"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "\\appdata\\"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 ~= nil then
        goto lbl_47
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_47::
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L1_1
L4_1 = 0
L5_1 = 4
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 == "\\\\?\\" then
  L2_1 = string
  L2_1 = L2_1.sub
  L3_1 = L1_1
  L4_1 = 5
  L2_1 = L2_1(L3_1, L4_1)
  L1_1 = L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "(.+)\\users\\([^\\]+)\\appdata"
L2_1, L3_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil and L3_1 ~= nil then
  L4_1 = #L2_1
  if not (L4_1 < 1) then
    L4_1 = #L3_1
    if not (L4_1 < 1) then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L2_1
      L6_1 = "\\"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if L4_1 == nil then
        goto lbl_88
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_88::
L4_1 = nil
L5_1 = ""
L6_1 = string
L6_1 = L6_1.find
L7_1 = L1_1
L8_1 = "\\appdata\\roaming\\"
L9_1 = 1
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 ~= nil then
  L4_1 = "\\appdata\\roaming"
  L5_1 = "appdata"
else
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L1_1
  L8_1 = "\\appdata\\local\\"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 ~= nil then
    L4_1 = "\\appdata\\local"
    L5_1 = "localappdata"
  else
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L1_1
    L8_1 = "\\appdata\\locallow\\"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L6_1 ~= nil then
      L4_1 = "\\appdata\\locallow"
      L5_1 = "locallowappdata"
    else
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
  end
end
if L4_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = string
L6_1 = L6_1.lower
L7_1 = mp
L7_1 = L7_1.get_contextdata
L8_1 = mp
L8_1 = L8_1.CONTEXT_DATA_FILENAME
L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L7_1(L8_1)
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
L7_1 = {}
L7_1.exe = true
L7_1.dll = true
L7_1[".js"] = true
L7_1.jse = true
L7_1.vbs = true
L7_1.vbe = true
L7_1.wsf = true
L7_1.jar = true
L7_1.hta = true
L7_1.lnk = true
L8_1 = string
L8_1 = L8_1.sub
L9_1 = L6_1
L10_1 = -3
L8_1 = L8_1(L9_1, L10_1)
L9_1 = true
if L8_1 ~= nil then
  L10_1 = #L8_1
  if not (L10_1 < 2) then
    L10_1 = L7_1[L8_1]
    if L10_1 == true then
      goto lbl_168
    end
  end
end
L9_1 = false
::lbl_168::
L10_1 = string
L10_1 = L10_1.match
L11_1 = L1_1
L12_1 = L4_1
L13_1 = "\\(.+)$"
L12_1 = L12_1 .. L13_1
L10_1 = L10_1(L11_1, L12_1)
if L10_1 ~= nil then
  L11_1 = string
  L11_1 = L11_1.len
  L12_1 = L10_1
  L11_1 = L11_1(L12_1)
  if L11_1 ~= 0 then
    L11_1 = string
    L11_1 = L11_1.find
    L12_1 = L10_1
    L13_1 = "\\"
    L14_1 = 1
    L15_1 = true
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    if L11_1 == nil then
      goto lbl_195
    end
  end
end
L11_1 = mp
L11_1 = L11_1.CLEAN
do return L11_1 end
::lbl_195::
L11_1 = string
L11_1 = L11_1.match
L12_1 = L6_1
L13_1 = "(.-[^%.]+)"
L11_1 = L11_1(L12_1, L13_1)
if L11_1 ~= nil then
  L12_1 = string
  L12_1 = L12_1.len
  L13_1 = L11_1
  L12_1 = L12_1(L13_1)
  if L12_1 ~= 0 then
    goto lbl_211
  end
end
L12_1 = mp
L12_1 = L12_1.CLEAN
do return L12_1 end
::lbl_211::
if L10_1 == L11_1 then
  L12_1 = mp
  L12_1 = L12_1.set_mpattribute
  L13_1 = "Lua:ContextSameFileFolderName.B!"
  L14_1 = L5_1
  L13_1 = L13_1 .. L14_1
  L12_1(L13_1)
  if L9_1 == true then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = "Lua:ContextSameFileFolderName.B!"
    L14_1 = L5_1
    L15_1 = "_"
    L16_1 = L8_1
    L13_1 = L13_1 .. L14_1 .. L15_1 .. L16_1
    L12_1(L13_1)
  end
  L12_1 = mp
  L12_1 = L12_1.INFECTED
  return L12_1
end
L12_1 = mp
L12_1 = L12_1.set_mpattribute
L13_1 = "Lua:ContextFileInFirstFolder.B!"
L14_1 = L5_1
L13_1 = L13_1 .. L14_1
L12_1(L13_1)
if L9_1 == true then
  L12_1 = mp
  L12_1 = L12_1.set_mpattribute
  L13_1 = "Lua:ContextFileInFirstFolder.B!"
  L14_1 = L5_1
  L15_1 = "_"
  L16_1 = L8_1
  L13_1 = L13_1 .. L14_1 .. L15_1 .. L16_1
  L12_1(L13_1)
end
if L5_1 == "localappdata" and L10_1 == "temp" then
  L12_1 = mp
  L12_1 = L12_1.set_mpattribute
  L13_1 = "Lua:Context/FileInTempFolder.A"
  L12_1(L13_1)
end
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
