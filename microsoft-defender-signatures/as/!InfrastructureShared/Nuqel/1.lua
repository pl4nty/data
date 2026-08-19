-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Nuqel\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (Remediation.Threat).Name
local l_0_1 = "/Nuqel"
local l_0_2 = false
if type(l_0_0) == "string" then
  local l_0_3 = (string.find)(l_0_0, l_0_1, 1, true)
  if l_0_3 ~= nil then
    local l_0_4 = l_0_3 + #l_0_1
    local l_0_5 = (string.sub)(l_0_0, l_0_4, l_0_4)
    l_0_2 = l_0_5 == "" or l_0_5 == "." or l_0_5 == "!"
  end
end
if l_0_2 then
  local l_0_6 = {}
  -- DECOMPILER ERROR at PC40: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC41: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC42: Overwrote pending register: R5 in 'AssignReg'

  for l_0_10,l_0_11 in ("%windir%\\system32\\setting.ini")("%windir%\\system32\\autorun.ini") do
    local l_0_12 = (MpCommon.ExpandEnvironmentVariables)(l_0_11)
    if l_0_12 ~= nil then
      (sysio.DeleteFile)(l_0_12)
    end
  end
  local l_0_13 = (sysio.RegOpenKey)("HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon")
  if l_0_13 then
    (sysio.SetRegValueAsString)(l_0_13, "Shell", "explorer.exe")
  end
  local l_0_14 = (sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System")
  if l_0_14 then
    for l_0_18,l_0_19 in pairs(l_0_14) do
      local l_0_20 = (sysio.RegOpenKey)(l_0_19)
      if l_0_20 then
        (sysio.DeleteRegValue)(l_0_20, "DisableTaskMgr")
      end
    end
  end
end
l_0_6 = string
l_0_6 = l_0_6.match
l_0_13 = l_0_0
l_0_14 = "Worm:Win32/Nuqel"
l_0_6 = l_0_6(l_0_13, l_0_14)
if l_0_6 then
  l_0_6 = sysio
  l_0_6 = l_0_6.RegExpandUserKey
  l_0_13 = "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System"
  l_0_6 = l_0_6(l_0_13)
  local l_0_21 = nil
  if l_0_6 then
    l_0_13 = pairs
    l_0_14 = l_0_6
    l_0_13 = l_0_13(l_0_14)
    for l_0_25,l_0_26 in l_0_13 do
      local l_0_24, l_0_25, l_0_26 = nil
      l_0_24 = sysio
      l_0_24 = l_0_24.RegOpenKey
      l_0_25 = 
      l_0_24 = l_0_24(l_0_25)
      local l_0_27 = nil
      if l_0_24 then
        l_0_25 = sysio
        l_0_25 = l_0_25.DeleteRegValue
        l_0_26 = l_0_24
        l_0_27 = "DisableRegistryTools"
        l_0_25(l_0_26, l_0_27)
      end
    end
  end
  if (Remediation.Threat).Resources then
    for l_0_31,l_0_32 in ipairs((Remediation.Threat).Resources) do
      local l_0_30, l_0_31, l_0_32 = nil
      l_0_30 = l_0_29.Schema
      if l_0_30 == "file" then
        l_0_30 = Infrastructure_SplitThreatPath
        l_0_31 = l_0_29.Path
        l_0_30 = l_0_30(l_0_31)
        local l_0_33 = nil
        if l_0_30 then
          l_0_31 = sysio
          l_0_31 = l_0_31.DeleteFile
          l_0_32 = l_0_30
          l_0_33 = "autorun.inf"
          l_0_32 = l_0_32 .. l_0_33
          l_0_31(l_0_32)
        end
      end
    end
  end
end
l_0_6 = string
l_0_6 = l_0_6.match
l_0_6 = l_0_6(l_0_0, "Worm:Win32/Nuqel%.AT")
if not l_0_6 then
  l_0_6 = string
  l_0_6 = l_0_6.match
  l_0_6 = l_0_6(l_0_0, "Worm:Win32/Nuqel%.BT")
end
if l_0_6 then
  l_0_6 = 0
  local l_0_34 = nil
  local l_0_35 = nil
  if (sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\Main") then
    for l_0_35,l_0_40 in pairs((sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\Main")) do
      local l_0_37, l_0_38, l_0_39, l_0_40 = nil
      l_0_37 = sysio
      l_0_37 = l_0_37.RegOpenKey
      l_0_38 = l_0_36
      l_0_37 = l_0_37(l_0_38)
      local l_0_41 = nil
      if l_0_37 then
        l_0_38 = sysio
        l_0_38 = l_0_38.GetRegValueAsString
        l_0_39 = l_0_37
        l_0_40 = "Start Page"
        l_0_38 = l_0_38(l_0_39, l_0_40)
        local l_0_42 = nil
        if l_0_38 then
          l_0_39 = string
          l_0_39 = l_0_39.match
          l_0_40 = l_0_38
          l_0_41 = "www%.blackcheta%.blogspot%.com"
          l_0_39 = l_0_39(l_0_40, l_0_41)
          if not l_0_39 then
            l_0_39 = string
            l_0_39 = l_0_39.match
            l_0_40 = l_0_38
            l_0_41 = "rnd009%.googlepages%.com/google%.html"
            l_0_39 = l_0_39(l_0_40, l_0_41)
          end
          if l_0_39 then
            l_0_6 = 1
          end
        end
      end
    end
  end
  if l_0_6 == 1 then
    if (sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\Main") then
      for l_0_46,l_0_47 in pairs((sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Internet Explorer\\Main")) do
        local l_0_44, l_0_45, l_0_46, l_0_47 = nil
        l_0_44 = sysio
        l_0_44 = l_0_44.RegOpenKey
        l_0_45 = l_0_43
        l_0_44 = l_0_44(l_0_45)
        local l_0_48 = nil
        if l_0_44 then
          l_0_45 = sysio
          l_0_45 = l_0_45.GetRegValueAsString
          l_0_46 = l_0_44
          l_0_47 = "Start Page"
          l_0_45 = l_0_45(l_0_46, l_0_47)
          local l_0_49 = nil
          if l_0_45 then
            l_0_46 = string
            l_0_46 = l_0_46.match
            l_0_47 = l_0_45
            l_0_48 = "www%.blackcheta%.blogspot%.com"
            l_0_46 = l_0_46(l_0_47, l_0_48)
            if not l_0_46 then
              l_0_46 = string
              l_0_46 = l_0_46.match
              l_0_47 = l_0_45
              l_0_48 = "rnd009%.googlepages%.com/google%.html"
              l_0_46 = l_0_46(l_0_47, l_0_48)
            end
            if l_0_46 then
              l_0_46 = sysio
              l_0_46 = l_0_46.SetRegValueAsString
              l_0_47 = l_0_44
              l_0_48 = "Start Page"
              l_0_49 = "http://go.microsoft.com/fwlink/?linkid=42826"
              l_0_46(l_0_47, l_0_48, l_0_49)
            end
          end
        end
      end
    end
    local l_0_50 = nil
    if (sysio.RegOpenKey)("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Main") then
      (sysio.SetRegValueAsString)((sysio.RegOpenKey)("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Main"), "Start Page", l_0_50)
      -- DECOMPILER ERROR at PC263: Overwrote pending register: R9 in 'AssignReg'

      ;
      (sysio.SetRegValueAsString)((sysio.RegOpenKey)("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Main"), "Default_Page_URL", l_0_50)
      -- DECOMPILER ERROR at PC269: Overwrote pending register: R9 in 'AssignReg'

      ;
      (sysio.SetRegValueAsString)((sysio.RegOpenKey)("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Main"), "Default_Search_URL", l_0_50)
      -- DECOMPILER ERROR at PC275: Overwrote pending register: R9 in 'AssignReg'

      ;
      (sysio.SetRegValueAsString)((sysio.RegOpenKey)("HKLM\\SOFTWARE\\Microsoft\\Internet Explorer\\Main"), "Search Page", l_0_50)
    end
  end
  local l_0_51 = l_0_50
  if (sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run") then
    for l_0_51,l_0_56 in pairs((sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")) do
      local l_0_53, l_0_54, l_0_55, l_0_56 = nil
      l_0_53 = sysio
      l_0_53 = l_0_53.RegOpenKey
      l_0_54 = l_0_52
      l_0_53 = l_0_53(l_0_54)
      local l_0_57 = nil
      if l_0_53 then
        l_0_54 = sysio
        l_0_54 = l_0_54.GetRegValueAsString
        l_0_55 = l_0_53
        l_0_56 = "google"
        l_0_54 = l_0_54(l_0_55, l_0_56)
        local l_0_58 = nil
        l_0_55 = type
        l_0_56 = l_0_54
        l_0_55 = l_0_55(l_0_56)
        if l_0_55 == "string" then
          l_0_55 = string
          l_0_55 = l_0_55.lower
          l_0_56 = l_0_54
          l_0_55 = l_0_55(l_0_56)
          if l_0_55 == "http://advgoogle.blogspot.com/" then
            l_0_55 = sysio
            l_0_55 = l_0_55.DeleteRegValue
            l_0_56 = l_0_53
            l_0_57 = "google"
            l_0_55(l_0_56, l_0_57)
          end
        end
      end
    end
  end
  local l_0_59 = nil
  if (sysio.RegOpenKey)("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run") then
    local l_0_60 = nil
    if type((sysio.GetRegValueAsString)((sysio.RegOpenKey)("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run"), "google")) == "string" and (string.lower)((sysio.GetRegValueAsString)((sysio.RegOpenKey)("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run"), "google")) == "http://advgoogle.blogspot.com/" then
      do
        (sysio.DeleteRegValue)((sysio.RegOpenKey)("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run"), l_0_59)
        -- DECOMPILER ERROR at PC343: Confused about usage of register R9 for local variables in 'ReleaseLocals'

        -- DECOMPILER ERROR: 21 unprocessed JMP targets
      end
    end
  end
end

