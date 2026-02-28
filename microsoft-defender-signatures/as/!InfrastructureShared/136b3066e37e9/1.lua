local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L0_1 = L1_1.utf8p1
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L1_1 = L1_1.utf8p1
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[4]
        L0_1 = L1_1.utf8p1
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[5]
        L1_1 = L1_1.utf8p1
        if L1_1 ~= nil then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[5]
          L0_1 = L1_1.utf8p1
      end
      else
        L1_1 = mp
        L1_1 = L1_1.CLEAN
        return L1_1
      end
    end
  end
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "\\([^\\]+)$"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L2_1[".dotm"] = true
L2_1[".xlsm"] = true
L2_1[".xltm"] = true
L2_1[".pptm"] = true
L2_1[".potm"] = true
L2_1[".sldm"] = true
L2_1[".xlam"] = true
L2_1[".ppam"] = true
L3_1 = string
L3_1 = L3_1.match
L4_1 = L1_1
L5_1 = "%.[^%.]+$"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= nil then
  L4_1 = L2_1[L3_1]
  if L4_1 then
    goto lbl_97
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_97::
L4_1 = string
L4_1 = L4_1.find
L5_1 = L1_1
L6_1 = "$normal.dot"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L1_1
  L6_1 = "normal.dotm"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L1_1
    L6_1 = "buildingblocks.dotx"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.sub
      L5_1 = L1_1
      L6_1 = 1
      L7_1 = 4
      L4_1 = L4_1(L5_1, L6_1, L7_1)
      if L4_1 ~= "~wrd" then
        L4_1 = string
        L4_1 = L4_1.sub
        L5_1 = L1_1
        L6_1 = 1
        L7_1 = 2
        L4_1 = L4_1(L5_1, L6_1, L7_1)
        if L4_1 ~= "~$" then
          L4_1 = string
          L4_1 = L4_1.sub
          L5_1 = L1_1
          L6_1 = 1
          L7_1 = 4
          L4_1 = L4_1(L5_1, L6_1, L7_1)
          if L4_1 ~= "~tmp" and L1_1 ~= "thumbs.db" and L1_1 ~= "desktop.ini" then
            L4_1 = string
            L4_1 = L4_1.sub
            L5_1 = L1_1
            L6_1 = -4
            L4_1 = L4_1(L5_1, L6_1)
            if L4_1 ~= ".tmp" then
              goto lbl_162
            end
          end
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_162::
L4_1 = bm
L4_1 = L4_1.get_imagepath
L4_1 = L4_1()
L5_1 = isnull
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L6_1 = string
L6_1 = L6_1.match
L7_1 = L5_1
L8_1 = "\\([^\\]+)$"
L6_1 = L6_1(L7_1, L8_1)
if L6_1 == nil then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = {}
L7_1["winword.exe"] = true
L7_1["excel.exe"] = true
L7_1["powerpnt.exe"] = true
L7_1["outlook.exe"] = true
L7_1["msaccess.exe"] = true
L7_1["onenote.exe"] = true
L7_1["officeclicktorun.exe"] = true
L7_1["officec2rclient.exe"] = true
L7_1["msiexec.exe"] = true
L7_1["trustedinstaller.exe"] = true
L7_1["tiworker.exe"] = true
L7_1["msmpeng.exe"] = true
L8_1 = L7_1[L6_1]
if L8_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
if L6_1 == "setup.exe" then
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L5_1
  L10_1 = "microsoft office"
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
end
L8_1 = mp
L8_1 = L8_1.ContextualExpandEnvironmentVariables
L9_1 = L0_1
L8_1 = L8_1(L9_1)
L9_1 = isnull
L10_1 = L8_1
L9_1 = L9_1(L10_1)
if not L9_1 then
  L9_1 = string
  L9_1 = L9_1.lower
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  L8_1 = L9_1
else
  L8_1 = L0_1
end
L9_1 = mp
L9_1 = L9_1.IsKnownFriendlyFile
L10_1 = L8_1
L11_1 = true
L12_1 = false
L9_1 = L9_1(L10_1, L11_1, L12_1)
if L9_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = sysio
L9_1 = L9_1.IsFileExists
L10_1 = L8_1
L9_1 = L9_1(L10_1)
if L9_1 then
  L9_1 = bm
  L9_1 = L9_1.add_related_file
  L10_1 = L8_1
  L9_1(L10_1)
  L9_1 = bm
  L9_1 = L9_1.add_threat_file
  L10_1 = L8_1
  L9_1(L10_1)
end
L9_1 = bm
L9_1 = L9_1.add_related_string
L10_1 = "DroppedTemplate"
L11_1 = L8_1
L12_1 = bm
L12_1 = L12_1.RelatedStringBMReport
L9_1(L10_1, L11_1, L12_1)
L9_1 = bm
L9_1 = L9_1.add_related_string
L10_1 = "DroppingProcess"
L11_1 = L5_1
L12_1 = bm
L12_1 = L12_1.RelatedStringBMReport
L9_1(L10_1, L11_1, L12_1)
L9_1 = add_parents
L9_1()
L9_1 = TrackPidAndTechniqueBM
L10_1 = "BM"
L11_1 = "T1137"
L12_1 = "office_application_startup"
L9_1(L10_1, L11_1, L12_1)
L9_1 = mp
L9_1 = L9_1.INFECTED
return L9_1
