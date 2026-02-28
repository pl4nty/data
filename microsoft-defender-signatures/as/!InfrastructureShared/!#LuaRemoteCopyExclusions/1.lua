local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
L4_1 = L1_1
L3_1 = L1_1.sub
L5_1 = -3
L3_1 = L3_1(L4_1, L5_1)
L4_1 = "tmf|emf|wmf|ost|spl|off|bak|m4a|mp4|mp3|bmp|avi|kgx|idx|etl|log|ico|ttf|qml|bak|dat|"
L6_1 = L4_1
L5_1 = L4_1.find
L7_1 = L3_1
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.get_mpattribute
L6_1 = "Lua:PeInExcludedOsPath"
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.get_mpattribute
L6_1 = "Lua:TTExclusion"
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if 268435456 < L2_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = "cachedata|moduleanalysiscache|ntbtlog.txt|remcomsvc.exe|install_fsprocsvc.exe|remoteauditservice.exe|fsprocsvc.exe|citrix workspace.lnk|user work log.lnk|oa user work log.lnk|.ses|local state|"
L7_1 = L5_1
L6_1 = L5_1.find
L8_1 = L1_1
L6_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = "idc_database.sqlite-journal|startupprofiledata-noninteractive|default.vg1|isbew64.exe|dismhost.exe|mighost.exe|qdaw3v01.exe|logmeinrescue.exe|isagenix.domainobjects.resources.dll|microsoft.win32.taskscheduler.resources.dll"
L8_1 = L6_1
L7_1 = L6_1.find
L9_1 = L1_1
L7_1 = L7_1(L8_1, L9_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L8_1 = L1_1
L7_1 = L1_1.find
L9_1 = "av%-%d%d%d?%d?%d?-%d%d?%d?%d?-%d%d?%d?%d?"
L7_1 = L7_1(L8_1, L9_1)
if not L7_1 then
  L8_1 = L1_1
  L7_1 = L1_1.match
  L9_1 = "^%.pyd"
  L7_1 = L7_1(L8_1, L9_1)
  if not L7_1 then
    L8_1 = L1_1
    L7_1 = L1_1.match
    L9_1 = "pdq.+%.exe"
    L7_1 = L7_1(L8_1, L9_1)
    if not L7_1 then
      goto lbl_92
    end
  end
end
L7_1 = mp
L7_1 = L7_1.INFECTED
do return L7_1 end
::lbl_92::
if L1_1 ~= "moduleanalysiscache" then
  L8_1 = L1_1
  L7_1 = L1_1.find
  L9_1 = "powershell_analysiscacheentry"
  L10_1 = 1
  L11_1 = true
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if not L7_1 then
    L8_1 = L1_1
    L7_1 = L1_1.find
    L9_1 = "psscriptpolicytest"
    L10_1 = 1
    L11_1 = true
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
    if not L7_1 then
      goto lbl_111
    end
  end
end
L7_1 = mp
L7_1 = L7_1.INFECTED
do return L7_1 end
::lbl_111::
L8_1 = L1_1
L7_1 = L1_1.find
L9_1 = "citrix workspace"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if not L7_1 then
  L8_1 = L1_1
  L7_1 = L1_1.find
  L9_1 = "user work log"
  L10_1 = 1
  L11_1 = true
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if not L7_1 then
    goto lbl_128
  end
end
L7_1 = mp
L7_1 = L7_1.INFECTED
do return L7_1 end
::lbl_128::
L8_1 = L1_1
L7_1 = L1_1.match
L9_1 = "%.store_?n?e?w?$"
L7_1 = L7_1(L8_1, L9_1)
if not L7_1 then
  L8_1 = L1_1
  L7_1 = L1_1.match
  L9_1 = "wk.+%.---$"
  L7_1 = L7_1(L8_1, L9_1)
  if not L7_1 then
    goto lbl_141
  end
end
L7_1 = mp
L7_1 = L7_1.INFECTED
do return L7_1 end
::lbl_141::
L8_1 = L1_1
L7_1 = L1_1.match
L9_1 = "zam.+%.trace$"
L7_1 = L7_1(L8_1, L9_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L8_1 = L0_1
L7_1 = L0_1.find
L9_1 = "windows\\ccm"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L8_1 = L0_1
L7_1 = L0_1.find
L9_1 = "windows.~bt\\newos\\"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L8_1 = L0_1
L7_1 = L0_1.match
L9_1 = "\\appdata\\.+\\google\\chrome\\user data\\"
L7_1 = L7_1(L8_1, L9_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L8_1 = L0_1
L7_1 = L0_1.match
L9_1 = "\\appdata\\.+\\microsoft\\edge\\user data\\"
L7_1 = L7_1(L8_1, L9_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L8_1 = L0_1
L7_1 = L0_1.find
L9_1 = "\\~bromium\\"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L8_1 = L0_1
L7_1 = L0_1.find
L9_1 = "\\service worker\\cachestorage\\"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L8_1 = L0_1
L7_1 = L0_1.find
L9_1 = "\\appdata\\"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 and (L2_1 < 54 or 1048575 < L2_1) then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L8_1 = L0_1
L7_1 = L0_1.find
L9_1 = "\\riskserver\\riskserver\\"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L8_1 = L0_1
L7_1 = L0_1.find
L9_1 = "\\production-qa6\\webservices\\"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L8_1 = L0_1
L7_1 = L0_1.find
L9_1 = "\\production-qa4\\webservices\\"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L8_1 = L0_1
L7_1 = L0_1.find
L9_1 = "\\pdqinventory-scanner\\"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L8_1 = L0_1
L7_1 = L0_1.find
L9_1 = "\\pdqdeployrunner\\"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L8_1 = L0_1
L7_1 = L0_1.find
L9_1 = "\\datacaptor interface server\\"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L8_1 = L0_1
L7_1 = L0_1.find
L9_1 = "\\nsrconsole\\"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L8_1 = L0_1
L7_1 = L0_1.find
L9_1 = "\\technicalsolutions\\riskserver\\"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
