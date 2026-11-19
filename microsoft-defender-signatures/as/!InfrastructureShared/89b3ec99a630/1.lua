-- Threat: !InfrastructureShared
-- Name: 89b3ec99a630
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2:lower()
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = extractDllForRegproc(l_0_0)
if l_0_1 then
  if not contains(l_0_0, ":\\windows\\") then
    return mp.CLEAN
  end
  if contains(l_0_0, "\\spool\\drivers\\") then
    return mp.CLEAN
  end
  if checkFileLastWriteTime(l_0_1, 3600) == false and mp.IsKnownFriendlyFile(l_0_1, true, false) == false then
    bm.add_related_file(l_0_1)
    local l_0_2 = {
      "winword.exe",
      "excel.exe",
      "powerpnt.exe",
      "mspub.exe",
      "wscript.exe",
      "cscript.exe",
      "mshta.exe",
      "powershell.exe",
      "pwsh.exe",
      "wmic.exe",
      "wmiprvse.exe"
    }
    if IsProcNameInParentProcessTree("BM", l_0_2, 2) then
      add_parents()
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
