local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L1_1
L4_1 = -4
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == ".dll" then
  L3_1 = string
  L3_1 = L3_1.len
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if L3_1 < 30 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L4_1 = L1_1
  L3_1 = L1_1.find
  L5_1 = "\\appdata\\locallow"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.match
    L4_1 = L1_1
    L5_1 = "\\appdata\\locallow\\%l%l%l%l%l%.dll"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.match
      L4_1 = L1_1
      L5_1 = "\\appdata\\locallow\\%l%l%l%l%l%l%.dll"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        L3_1 = string
        L3_1 = L3_1.match
        L4_1 = L1_1
        L5_1 = "\\appdata\\locallow\\%1%l%l%l%l%l%l%.dll"
        L3_1 = L3_1(L4_1, L5_1)
      end
    end
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.set_mpattribute
      L4_1 = "Lua:NotodarFilename.A"
      L3_1(L4_1)
    end
  else
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L1_1
    L5_1 = -30
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 == "\\appdata\\local\\temp\\mdi064.dll" then
      L3_1 = mp
      L3_1 = L3_1.set_mpattribute
      L4_1 = "Lua:FigyekDroppedFile.A"
      L3_1(L4_1)
    end
  end
elseif L2_1 == ".exe" then
  L3_1 = string
  L3_1 = L3_1.len
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if L3_1 < 19 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L4_1 = L1_1
  L3_1 = L1_1.find
  L5_1 = "\\appdata\\roaming\\"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 ~= nil then
    L4_1 = L1_1
    L3_1 = L1_1.match
    L5_1 = "(.+\\)([^\\]+)$"
    L3_1, L4_1 = L3_1(L4_1, L5_1)
    L5_1 = string
    L5_1 = L5_1.sub
    L6_1 = L3_1
    L7_1 = -17
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 == "\\appdata\\roaming\\" then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:SuspiciousExeFileInAppdata.A"
      L5_1(L6_1)
    else
      L5_1 = string
      L5_1 = L5_1.sub
      L6_1 = L3_1
      L7_1 = -27
      L5_1 = L5_1(L6_1, L7_1)
      if L5_1 == "\\appdata\\roaming\\microsoft\\" then
        L5_1 = mp
        L5_1 = L5_1.set_mpattribute
        L6_1 = "Lua:SuspiciousExeFileInAppdataMicrosoft.A"
        L5_1(L6_1)
      else
        L5_1 = string
        L5_1 = L5_1.sub
        L6_1 = L3_1
        L7_1 = -35
        L5_1 = L5_1(L6_1, L7_1)
        if L5_1 == "\\appdata\\roaming\\microsoft\\windows\\" then
          L5_1 = mp
          L5_1 = L5_1.set_mpattribute
          L6_1 = "Lua:SuspiciousExeFileInAppdataMicrosoftWindows.A"
          L5_1(L6_1)
        else
          L5_1 = string
          L5_1 = L5_1.sub
          L6_1 = L3_1
          L7_1 = -31
          L5_1 = L5_1(L6_1, L7_1)
          if L5_1 == "\\appdata\\roaming\\windowsupdate\\" then
            L5_1 = mp
            L5_1 = L5_1.set_mpattribute
            L6_1 = "Lua:SuspiciousExeFileInAppdataWindowsupdate.A"
            L5_1(L6_1)
          else
            L5_1 = string
            L5_1 = L5_1.match
            L6_1 = L1_1
            L7_1 = "\\appdata\\roaming\\%w%whost\\%w%whost.exe$"
            L5_1 = L5_1(L6_1, L7_1)
            if L5_1 then
              L5_1 = mp
              L5_1 = L5_1.set_mpattribute
              L6_1 = "Lua:SuspiciousHostExeFileInAppdata.A"
              L5_1(L6_1)
            end
          end
        end
      end
    end
  else
    L4_1 = L1_1
    L3_1 = L1_1.find
    L5_1 = "\\appdata\\local"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 ~= nil then
      L4_1 = L1_1
      L3_1 = L1_1.match
      L5_1 = "(.+\\)([^\\]+)$"
      L3_1, L4_1 = L3_1(L4_1, L5_1)
      L5_1 = string
      L5_1 = L5_1.sub
      L6_1 = L3_1
      L7_1 = -22
      L5_1 = L5_1(L6_1, L7_1)
      if L5_1 == "\\local\\default folder\\" then
        L5_1 = mp
        L5_1 = L5_1.set_mpattribute
        L6_1 = "Lua:SuspiciousExeFileLocationInLocalAppdata.A"
        L5_1(L6_1)
      else
        L5_1 = string
        L5_1 = L5_1.sub
        L6_1 = L3_1
        L7_1 = -15
        L5_1 = L5_1(L6_1, L7_1)
        if L5_1 == "\\appdata\\local\\" then
          L5_1 = mp
          L5_1 = L5_1.set_mpattribute
          L6_1 = "Lua:SuspiciousExeFileInLocalAppdata.A"
          L5_1(L6_1)
        else
          L5_1 = string
          L5_1 = L5_1.sub
          L6_1 = L3_1
          L7_1 = -18
          L5_1 = L5_1(L6_1, L7_1)
          if L5_1 == "\\appdata\\locallow\\" then
            L5_1 = mp
            L5_1 = L5_1.set_mpattribute
            L6_1 = "Lua:SuspiciousExeFileInLocalLowAppdata.A"
            L5_1(L6_1)
          end
        end
      end
    else
      L4_1 = L1_1
      L3_1 = L1_1.find
      L5_1 = "\\appdata\\"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 ~= nil then
        L4_1 = L1_1
        L3_1 = L1_1.match
        L5_1 = "(.+\\)([^\\]+)$"
        L3_1, L4_1 = L3_1(L4_1, L5_1)
        L5_1 = string
        L5_1 = L5_1.sub
        L6_1 = L3_1
        L7_1 = -9
        L5_1 = L5_1(L6_1, L7_1)
        if L5_1 == "\\appdata\\" then
          L5_1 = mp
          L5_1 = L5_1.set_mpattribute
          L6_1 = "Lua:SuspiciousExeFileInAppdata.B"
          L5_1(L6_1)
        end
      else
        L4_1 = L1_1
        L3_1 = L1_1.find
        L5_1 = ":\\programdata\\"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 ~= nil then
          L4_1 = L1_1
          L3_1 = L1_1.match
          L5_1 = "(.+\\)([^\\]+)$"
          L3_1, L4_1 = L3_1(L4_1, L5_1)
          L5_1 = string
          L5_1 = L5_1.sub
          L6_1 = L3_1
          L7_1 = -14
          L5_1 = L5_1(L6_1, L7_1)
          if L5_1 == ":\\programdata\\" then
            L5_1 = mp
            L5_1 = L5_1.set_mpattribute
            L6_1 = "Lua:SuspiciousExeFileInProgramData.A"
            L5_1(L6_1)
          else
            L5_1 = string
            L5_1 = L5_1.match
            L6_1 = L3_1
            L7_1 = ":\\programdata\\%d%d%d%d%d%d\\$"
            L5_1 = L5_1(L6_1, L7_1)
            if not L5_1 then
              L5_1 = string
              L5_1 = L5_1.sub
              L6_1 = L3_1
              L7_1 = -24
              L5_1 = L5_1(L6_1, L7_1)
            end
            if L5_1 == ":\\programdata\\microsoft\\" then
              L5_1 = mp
              L5_1 = L5_1.set_mpattribute
              L6_1 = "Lua:SuspiciousExeFileLocationInProgramData.A"
              L5_1(L6_1)
            end
          end
        else
          L4_1 = L1_1
          L3_1 = L1_1.find
          L5_1 = "\\documents\\"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if L3_1 ~= nil then
            L4_1 = L1_1
            L3_1 = L1_1.match
            L5_1 = "(.+\\)([^\\]+)$"
            L3_1, L4_1 = L3_1(L4_1, L5_1)
            L5_1 = string
            L5_1 = L5_1.match
            L6_1 = L3_1
            L7_1 = "\\users\\.+\\documents\\$"
            L5_1 = L5_1(L6_1, L7_1)
            if L5_1 then
              L5_1 = mp
              L5_1 = L5_1.set_mpattribute
              L6_1 = "Lua:SuspiciousExeFileInUserDocumentsFolder.A"
              L5_1(L6_1)
            end
          end
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
