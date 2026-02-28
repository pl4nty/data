local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_PATH
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 <= 3) then
    goto lbl_24
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_24::
L2_1 = #L1_1
if L2_1 <= 20 then
  L2_1 = StringStartsWith
  L3_1 = L1_1
  L4_1 = "note_"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = StringEndsWith
    L3_1 = L1_1
    L4_1 = "107-41d.pdf"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "Lua:FnameContext_TurlaPhish.A"
      L2_1(L3_1)
    end
  end
end
if L1_1 == "postanovlenie apelljacionnoj instancii.scr" then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:FnameContext_TurlaBinary.A"
  L2_1(L3_1)
end
if L0_1 ~= nil then
  L2_1 = #L0_1
  if 4 < L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "\\appdata\\local\\microsoft\\office\\solutionpackages\\"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= nil then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "Lua:FileContext/FileInOfficeSolutionPackages.A"
      L2_1(L3_1)
    end
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "\\program files\\windowsapps\\"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= nil then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "Lua:FileContext/FileInWindowsApps.A"
      L2_1(L3_1)
    end
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "\\program files\\adobe\\acrobat reader"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= nil then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "Lua:FileContext/FileInAdobeFolder.A"
      L2_1(L3_1)
    end
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "\\appdata\\local\\microsoft\\windows\\inetcache\\"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= nil then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "Lua:FileContext/FileInINetCache.A"
      L2_1(L3_1)
    end
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "\\appdata\\local\\temp\\chrome_bits_"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= nil then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "Lua:FileContext/FileInTempChromeBits.A"
      L2_1(L3_1)
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
