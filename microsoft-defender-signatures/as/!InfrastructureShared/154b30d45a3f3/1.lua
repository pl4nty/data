local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if 15 <= L1_1 then
    L1_1 = {}
    L1_1["cmd.exe"] = true
    L1_1["powershell.exe"] = true
    L1_1["cscript.exe"] = true
    L1_1["wscript.exe"] = true
    L1_1["mshta.exe"] = true
    L1_1["pwsh.exe"] = true
    L1_1["rundll32.exe"] = true
    L1_1["regsvr32.exe"] = true
    L1_1["regasm.exe"] = true
    L1_1["regsvcs.exe"] = true
    L1_1["officesvcmgr.exe"] = true
    L1_1["officeclicktorun.exe"] = true
    L1_1["integrator.exe"] = true
    L2_1 = string
    L2_1 = L2_1.lower
    L4_1 = L0_1
    L3_1 = L0_1.match
    L5_1 = "\\([^\\]+)$"
    L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1, L5_1)
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    L3_1 = L1_1[L2_1]
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
  end
end
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[14]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[14]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[14]
    L1_1 = L2_1.utf8p2
  end
end
if L1_1 ~= nil then
  L2_1 = bm_AddRelatedFileFromCommandLine
  L3_1 = L1_1
  L4_1 = nil
  L5_1 = nil
  L6_1 = 1
  L2_1(L3_1, L4_1, L5_1, L6_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
