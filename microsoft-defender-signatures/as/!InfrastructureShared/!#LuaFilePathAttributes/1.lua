local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "(.+\\)([^\\]+)$"
L1_1, L2_1 = L1_1(L2_1, L3_1)
if L1_1 == nil or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L1_1
L5_1 = "\\appdata\\"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:FileInsideAppDataFolder"
  L3_1(L4_1)
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L1_1
  L5_1 = "\\appdata\\local\\"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:FileInsideAppDataLocalFolder"
    L3_1(L4_1)
    L3_1 = string
    L3_1 = L3_1.match
    L4_1 = L1_1
    L5_1 = "\\appdata\\local\\temp\\"
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.set_mpattribute
      L4_1 = "Lua:FileInsideAppDataLocalTempFolder"
      L3_1(L4_1)
    end
  else
    L3_1 = string
    L3_1 = L3_1.match
    L4_1 = L1_1
    L5_1 = "\\appdata\\roaming\\"
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.set_mpattribute
      L4_1 = "Lua:FileInsideAppDataRoamingFolder"
      L3_1(L4_1)
    end
  end
else
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L1_1
  L5_1 = "\\program files\\"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:FileInsideProgramFilesFolder"
    L3_1(L4_1)
  else
    L3_1 = string
    L3_1 = L3_1.match
    L4_1 = L1_1
    L5_1 = "\\program files (x86)\\"
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.set_mpattribute
      L4_1 = "Lua:FileInsideProgramFilesX86Folder"
      L3_1(L4_1)
    else
      L3_1 = string
      L3_1 = L3_1.match
      L4_1 = L1_1
      L5_1 = "\\programdata\\"
      L3_1 = L3_1(L4_1, L5_1)
      if L3_1 then
        L3_1 = mp
        L3_1 = L3_1.set_mpattribute
        L4_1 = "Lua:FileInsideProgramDataFolder"
        L3_1(L4_1)
      else
        L3_1 = string
        L3_1 = L3_1.match
        L4_1 = L1_1
        L5_1 = "\\windows\\system32\\"
        L3_1 = L3_1(L4_1, L5_1)
        if L3_1 then
          L3_1 = mp
          L3_1 = L3_1.set_mpattribute
          L4_1 = "Lua:FileInsideSystemFolder"
          L3_1(L4_1)
        else
          L3_1 = string
          L3_1 = L3_1.match
          L4_1 = L1_1
          L5_1 = "c:\\windows\\"
          L3_1 = L3_1(L4_1, L5_1)
          if L3_1 then
            L3_1 = mp
            L3_1 = L3_1.set_mpattribute
            L4_1 = "Lua:FileInsideWindowsFolder"
            L3_1(L4_1)
          else
            L3_1 = string
            L3_1 = L3_1.match
            L4_1 = L1_1
            L5_1 = "\\users\\[^\\]+\\"
            L3_1 = L3_1(L4_1, L5_1)
            if L3_1 then
              L3_1 = mp
              L3_1 = L3_1.set_mpattribute
              L4_1 = "Lua:FileInsideUserProfileFolder"
              L3_1(L4_1)
              L3_1 = string
              L3_1 = L3_1.match
              L4_1 = L1_1
              L5_1 = "\\users\\[^\\]+\\documents\\"
              L3_1 = L3_1(L4_1, L5_1)
              if L3_1 then
                L3_1 = mp
                L3_1 = L3_1.set_mpattribute
                L4_1 = "Lua:FileInsideUserDocumentFolder"
                L3_1(L4_1)
              else
                L3_1 = string
                L3_1 = L3_1.match
                L4_1 = L1_1
                L5_1 = "\\users\\[^\\]+\\downloads\\"
                L3_1 = L3_1(L4_1, L5_1)
                if L3_1 then
                  L3_1 = mp
                  L3_1 = L3_1.set_mpattribute
                  L4_1 = "Lua:FileInsideUserDownloadFolder"
                  L3_1(L4_1)
                else
                  L3_1 = string
                  L3_1 = L3_1.match
                  L4_1 = L1_1
                  L5_1 = "\\users\\[^\\]+\\desktop\\"
                  L3_1 = L3_1(L4_1, L5_1)
                  if L3_1 then
                    L3_1 = mp
                    L3_1 = L3_1.set_mpattribute
                    L4_1 = "Lua:FileInsideUserDesktopFolder"
                    L3_1(L4_1)
                  else
                    L3_1 = string
                    L3_1 = L3_1.match
                    L4_1 = L1_1
                    L5_1 = "\\users\\public\\"
                    L3_1 = L3_1(L4_1, L5_1)
                    if L3_1 then
                      L3_1 = mp
                      L3_1 = L3_1.set_mpattribute
                      L4_1 = "Lua:FileInsideUserPublicFolder"
                      L3_1(L4_1)
                    end
                  end
                end
              end
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
