local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
L1_1 = L0_1
L0_1 = L0_1.lower
L0_1 = L0_1(L1_1)
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "%.(%w+)%->(.*)$"
L1_1, L2_1 = L1_1(L2_1, L3_1)
if L1_1 == nil or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L3_1["7z"] = "Lua:FileIn7z"
L3_1.apk = "Lua:FileInApk"
L3_1.cpio = "Lua:FileInCpio"
L3_1.jar = "Lua:FileInJar"
L3_1.rar = "Lua:FileInRar"
L3_1.tar = "Lua:FileInTar"
L3_1.war = "Lua:FileInWar"
L3_1.zip = "Lua:FileInZip"
L3_1.iso = "Lua:FileInIso"
L3_1.tgz = "Lua:FileInTarGzip"
L4_1 = L3_1[L1_1]
if L4_1 ~= nil then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = L3_1[L1_1]
  L4_1(L5_1)
else
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L2_1
L4_1 = L2_1.find
L6_1 = "../"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L5_1 = L2_1
  L4_1 = L2_1.find
  L6_1 = "..\\"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    goto lbl_56
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "Lua:DirPathTraversal"
L4_1(L5_1)
::lbl_56::
L5_1 = L2_1
L4_1 = L2_1.find
L6_1 = "../../"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L5_1 = L2_1
  L4_1 = L2_1.find
  L6_1 = "..\\..\\"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    goto lbl_74
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "Lua:DirPathTraversal2plus"
L4_1(L5_1)
::lbl_74::
L5_1 = L2_1
L4_1 = L2_1.find
L6_1 = "\\windows\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L5_1 = L2_1
  L4_1 = L2_1.find
  L6_1 = "/windows/"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    goto lbl_92
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "Lua:DirPathWindows"
L4_1(L5_1)
::lbl_92::
L5_1 = L2_1
L4_1 = L2_1.find
L6_1 = "\\system32\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L5_1 = L2_1
  L4_1 = L2_1.find
  L6_1 = "/system32/"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    goto lbl_110
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "Lua:DirPathSystem32"
L4_1(L5_1)
::lbl_110::
L5_1 = L2_1
L4_1 = L2_1.find
L6_1 = "\\microsoft\\windows\\start menu\\startup\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L5_1 = L2_1
  L4_1 = L2_1.find
  L6_1 = "/microsoft/windows/start menu/startup/"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    goto lbl_128
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "Lua:DirPathStartup"
L4_1(L5_1)
::lbl_128::
L5_1 = L2_1
L4_1 = L2_1.find
L6_1 = "\\programdata\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L5_1 = L2_1
  L4_1 = L2_1.find
  L6_1 = "/programdata/"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    goto lbl_146
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "Lua:DirPathProgramData"
L4_1(L5_1)
::lbl_146::
L5_1 = L2_1
L4_1 = L2_1.find
L6_1 = "\\program files\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L5_1 = L2_1
  L4_1 = L2_1.find
  L6_1 = "/program files/"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    goto lbl_164
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "Lua:DirPathProgramFiles"
L4_1(L5_1)
::lbl_164::
L5_1 = L2_1
L4_1 = L2_1.find
L6_1 = "\\program files (x86)\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L5_1 = L2_1
  L4_1 = L2_1.find
  L6_1 = "/program files (x86)/"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    goto lbl_182
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "Lua:DirPathProgramFiles86"
L4_1(L5_1)
::lbl_182::
if L1_1 == "iso" then
  L5_1 = L2_1
  L4_1 = L2_1.find
  L6_1 = "\\"
  L7_1 = 2
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L5_1 = L2_1
    L4_1 = L2_1.find
    L6_1 = "/"
    L7_1 = 2
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "Lua:FileOnIsoRoot"
      L4_1(L5_1)
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
