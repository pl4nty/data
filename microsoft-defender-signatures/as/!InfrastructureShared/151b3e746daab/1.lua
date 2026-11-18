-- Threat: !InfrastructureShared
-- Name: 151b3e746daab
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_imagepath()
if not l_0_0 or string.find(l_0_0, "/nmap", -5, true) or string.find(l_0_0, "/sudo", -5, true) or string.find(l_0_0, "/bash", -5, true) or string.find(l_0_0, "/zsh", -4, true) or string.find(l_0_0, "/sh", -3, true) or string.find(l_0_0, "/dash", -5, true) or string.find(l_0_0, "/ksh93", -6, true) or string.find(l_0_0, "/ksh", -4, true) or string.find(l_0_0, "/tcsh", -5, true) or string.find(l_0_0, "/python", 1, true) or string.find(l_0_0, "/perl", -5, true) or string.find(l_0_0, "/ruby", -5, true) or string.find(l_0_0, "/pwsh", -5, true) or IsExcludedByImagePath(l_0_0) then
  return mp.CLEAN
end
addRelatedProcess()
return mp.INFECTED
