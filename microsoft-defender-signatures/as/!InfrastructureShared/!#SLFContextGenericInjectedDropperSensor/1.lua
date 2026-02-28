local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 1000000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L1_1[".com"] = ""
L1_1[".cpl"] = ""
L1_1[".exe"] = ""
L1_1[".pif"] = ""
L1_1[".scr"] = ""
L1_1[".dll"] = ""
L2_1 = string
L2_1 = L2_1.lower
L3_1 = string
L3_1 = L3_1.sub
L4_1 = mp
L4_1 = L4_1.getfilename
L4_1 = L4_1()
L5_1 = -4
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1)
L3_1 = L1_1[L2_1]
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_SCANREASON
L3_1 = L3_1(L4_1)
L4_1 = mp
L4_1 = L4_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L3_1 == L4_1 then
  L4_1 = mp
  L4_1 = L4_1.get_contextdata
  L5_1 = mp
  L5_1 = L5_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L4_1 = L4_1(L5_1)
  if L4_1 == true then
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = mp
    L5_1 = L5_1.get_contextdata
    L6_1 = mp
    L6_1 = L6_1.CONTEXT_DATA_FILEPATH
    L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1 = L5_1(L6_1)
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1)
    L5_1 = {}
    L6_1 = "\\program files\\windowsapps\\"
    L7_1 = "\\program files"
    L8_1 = "\\windowsapps\\"
    L9_1 = "\\filehistory\\"
    L10_1 = "\\windows.old\\"
    L11_1 = "\\grouppolicy\\datastore\\"
    L12_1 = "\\microsoft office\\updates\\download\\packagefiles\\"
    L13_1 = "\\windows\\assembly\\nativeimages"
    L14_1 = "\\microsoft\\windows\\devicesoftwareupdates\\"
    L15_1 = "$windows.~bt\\"
    L16_1 = "\\nvidia\\"
    L17_1 = "\\nvidia corporation\\"
    L18_1 = "\\programs\\python\\"
    L19_1 = "\\lenovo\\"
    L20_1 = "\\windows\\installer\\"
    L21_1 = "\\windows\\system32\\"
    L22_1 = "\\windows\\syswow64\\"
    L23_1 = "\\microsoft\\visualstudio\\"
    L24_1 = "\\drpsu\\programs\\"
    L25_1 = "\\wudownloadcache\\"
    L26_1 = "\\smartsvn\\"
    L27_1 = "\\temp\\_mei"
    L28_1 = "\\hp\\printscout\\"
    L5_1[1] = L6_1
    L5_1[2] = L7_1
    L5_1[3] = L8_1
    L5_1[4] = L9_1
    L5_1[5] = L10_1
    L5_1[6] = L11_1
    L5_1[7] = L12_1
    L5_1[8] = L13_1
    L5_1[9] = L14_1
    L5_1[10] = L15_1
    L5_1[11] = L16_1
    L5_1[12] = L17_1
    L5_1[13] = L18_1
    L5_1[14] = L19_1
    L5_1[15] = L20_1
    L5_1[16] = L21_1
    L5_1[17] = L22_1
    L5_1[18] = L23_1
    L5_1[19] = L24_1
    L5_1[20] = L25_1
    L5_1[21] = L26_1
    L5_1[22] = L27_1
    L5_1[23] = L28_1
    L6_1 = pairs
    L7_1 = L5_1
    L6_1, L7_1, L8_1 = L6_1(L7_1)
    for L9_1, L10_1 in L6_1, L7_1, L8_1 do
      L12_1 = L4_1
      L11_1 = L4_1.find
      L13_1 = L10_1
      L14_1 = 1
      L15_1 = true
      L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
      if L11_1 ~= nil then
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
    end
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = mp
    L7_1 = L7_1.get_contextdata
    L8_1 = mp
    L8_1 = L8_1.CONTEXT_DATA_PROCESSNAME
    L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1 = L7_1(L8_1)
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1)
    L7_1 = "|"
    L8_1 = L6_1
    L9_1 = "|"
    L7_1 = L7_1 .. L8_1 .. L9_1
    L8_1 = "|regedit.exe|hh.exe|winhlp32.exe|bfsvc.exe|splwow64.exe|helppane.exe|svchost.exe|reg.exe|dllhost.exe|regsvr32.exe|userinit.exe|secedit.exe|calc.exe|taskmgr.exe|runonce.exe|certutil.exe|find.exe|winver.exe|ctfmon.exe|gpscript.exe|net.exe|powercfg.exe|lsass.exe|tcpsvcs.exe|msfeedssync.exe|taskeng.exe|drvinst.exe|mshta.exe|dllhst3g.exe|sdiagnhost.exe|werfault.exe|sfc.exe|upnpcont.exe|wiaacmgr.exe|mmc.exe|mspaint.exe|logagent.exe|cmmon32.exe|dpnsvr.exe|net1.exe|dplaysvr.exe|schtasks.exe|dvdupgrd.exe|fixmapi.exe|systray.exe|netsh.exe|mobsync.exe|unregmp2.exe|sethc.exe|"
    L9_1 = false
    L11_1 = L8_1
    L10_1 = L8_1.find
    L12_1 = L7_1
    L13_1 = 1
    L14_1 = true
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    if L10_1 then
      L10_1 = mp
      L10_1 = L10_1.get_mpattribute
      L11_1 = "BM_MZ_FILE"
      L10_1 = L10_1(L11_1)
      if L10_1 then
        L10_1 = mp
        L10_1 = L10_1.set_mpattribute
        L11_1 = "TEL:Lua"
        L12_1 = L6_1
        L13_1 = "GenericDropperMZ_FILE"
        L11_1 = L11_1 .. L12_1 .. L13_1
        L10_1(L11_1)
        L9_1 = true
      end
      if L9_1 == true then
        L10_1 = mp
        L10_1 = L10_1.INFECTED
        return L10_1
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
