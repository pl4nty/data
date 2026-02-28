local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.get_parent_filehandle
L1_1 = L1_1()
L2_1 = mp
L2_1 = L2_1.is_handle_nil
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_FILEPATH
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
if L2_1 ~= nil then
  L3_1 = #L2_1
  if not (L3_1 < 23) then
    goto lbl_45
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_45::
L3_1 = nil
L4_1 = nil
L5_1 = string
L5_1 = L5_1.find
L6_1 = L2_1
L7_1 = "\\appdata\\roaming\\"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.ContextualExpandEnvironmentVariables
  L6_1 = "%appdata%"
  L5_1 = L5_1(L6_1)
  L3_1 = L5_1
  L4_1 = "appdata"
else
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = "\\appdata\\local\\"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.ContextualExpandEnvironmentVariables
    L6_1 = "%localappdata%"
    L5_1 = L5_1(L6_1)
    L3_1 = L5_1
    L4_1 = "localappdata"
  else
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L2_1
    L7_1 = "\\appdata\\locallow\\"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if L5_1 ~= nil then
      L5_1 = mp
      L5_1 = L5_1.ContextualExpandEnvironmentVariables
      L6_1 = "%localappdata%Low"
      L5_1 = L5_1(L6_1)
      L3_1 = L5_1
      L4_1 = "locallowappdata"
    else
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
  end
end
if L3_1 ~= nil then
  L5_1 = #L3_1
  if not (L5_1 < 23) then
    goto lbl_105
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_105::
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L3_1
L5_1 = L5_1(L6_1)
L3_1 = L5_1
L5_1 = string
L5_1 = L5_1.lower
L6_1 = mp
L6_1 = L6_1.get_contextdata
L7_1 = mp
L7_1 = L7_1.CONTEXT_DATA_FILENAME
L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L6_1(L7_1)
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
L6_1 = {}
L6_1.exe = true
L6_1.dll = true
L6_1[".js"] = true
L6_1.jse = true
L6_1.vbs = true
L6_1.vbe = true
L6_1.wsf = true
L6_1.jar = true
L6_1.hta = true
L6_1.lnk = true
L7_1 = string
L7_1 = L7_1.sub
L8_1 = L5_1
L9_1 = -3
L7_1 = L7_1(L8_1, L9_1)
L8_1 = true
if L7_1 ~= nil then
  L9_1 = #L7_1
  if not (L9_1 < 2) then
    L9_1 = L6_1[L7_1]
    if L9_1 == true then
      goto lbl_144
    end
  end
end
L8_1 = false
::lbl_144::
L9_1 = string
L9_1 = L9_1.sub
L10_1 = L2_1
L11_1 = 0
L12_1 = 4
L9_1 = L9_1(L10_1, L11_1, L12_1)
if L9_1 == "\\\\?\\" then
  L9_1 = string
  L9_1 = L9_1.sub
  L10_1 = L2_1
  L11_1 = 5
  L9_1 = L9_1(L10_1, L11_1)
  L2_1 = L9_1
end
L9_1 = #L2_1
L10_1 = #L3_1
if not (L9_1 <= L10_1) then
  L9_1 = string
  L9_1 = L9_1.sub
  L10_1 = L2_1
  L11_1 = 0
  L12_1 = #L3_1
  L9_1 = L9_1(L10_1, L11_1, L12_1)
  if L9_1 == L3_1 then
    goto lbl_173
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_173::
L9_1 = string
L9_1 = L9_1.match
L10_1 = L2_1
L11_1 = L3_1
L12_1 = "\\(.+)$"
L11_1 = L11_1 .. L12_1
L9_1 = L9_1(L10_1, L11_1)
if L9_1 ~= nil then
  L10_1 = string
  L10_1 = L10_1.len
  L11_1 = L9_1
  L10_1 = L10_1(L11_1)
  if L10_1 ~= 0 then
    L10_1 = string
    L10_1 = L10_1.find
    L11_1 = L9_1
    L12_1 = "\\"
    L13_1 = 1
    L14_1 = true
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    if L10_1 == nil then
      goto lbl_200
    end
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
do return L10_1 end
::lbl_200::
L10_1 = string
L10_1 = L10_1.match
L11_1 = L5_1
L12_1 = "(.-[^%.]+)"
L10_1 = L10_1(L11_1, L12_1)
if L10_1 ~= nil then
  L11_1 = string
  L11_1 = L11_1.len
  L12_1 = L10_1
  L11_1 = L11_1(L12_1)
  if L11_1 ~= 0 then
    goto lbl_216
  end
end
L11_1 = mp
L11_1 = L11_1.CLEAN
do return L11_1 end
::lbl_216::
if L9_1 == L10_1 then
  L11_1 = mp
  L11_1 = L11_1.set_mpattribute
  L12_1 = "Lua:ContextSameFileFolderName.A!"
  L13_1 = L4_1
  L12_1 = L12_1 .. L13_1
  L11_1(L12_1)
  if L8_1 == true then
    L11_1 = mp
    L11_1 = L11_1.set_mpattribute
    L12_1 = "Lua:ContextSameFileFolderName.A!"
    L13_1 = L4_1
    L14_1 = "_"
    L15_1 = L7_1
    L12_1 = L12_1 .. L13_1 .. L14_1 .. L15_1
    L11_1(L12_1)
  end
  L11_1 = mp
  L11_1 = L11_1.INFECTED
  return L11_1
end
L11_1 = mp
L11_1 = L11_1.set_mpattribute
L12_1 = "Lua:ContextFileInFirstFolder.A!"
L13_1 = L4_1
L12_1 = L12_1 .. L13_1
L11_1(L12_1)
if L8_1 == true then
  L11_1 = mp
  L11_1 = L11_1.set_mpattribute
  L12_1 = "Lua:ContextFileInFirstFolder.A!"
  L13_1 = L4_1
  L14_1 = "_"
  L15_1 = L7_1
  L12_1 = L12_1 .. L13_1 .. L14_1 .. L15_1
  L11_1(L12_1)
end
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
