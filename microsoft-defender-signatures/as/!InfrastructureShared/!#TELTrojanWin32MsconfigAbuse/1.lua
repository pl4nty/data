local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = peattributes
L0_1 = L0_1.isdll
if not L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.isdriver
  if not L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.isdamaged
    if not L0_1 then
      goto lbl_16
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_16::
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1, L2_1, L3_1, L4_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 ~= "msconfig.exe" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1)
L2_1 = {}
L2_1["cmd.exe"] = true
L2_1["useraccountcontrolsettings.exe"] = true
L2_1["taskmgr.exe"] = true
L2_1["control.exe"] = true
L2_1["mmc.exe"] = true
L2_1["msinfo32.exe"] = true
L2_1["winver.exe"] = true
L2_1["werfault.exe"] = true
L2_1["eventvwr.exe"] = true
L2_1["msra.exe"] = true
L2_1["rstrui.exe"] = true
L2_1["sgtool.exe"] = true
L2_1["resmon.exe"] = true
L2_1["perfmon.exe"] = true
L2_1["regedit32.exe"] = true
L3_1 = L2_1[L1_1]
if L3_1 == true then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
