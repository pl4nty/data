-- Threat: !InfrastructureShared
-- Name: 56bb380647ff2
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[22].matched and this_sigattrlog[22].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[22].utf8p2)
elseif this_sigattrlog[23].matched and this_sigattrlog[23].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[23].utf8p2)
end

function checkTaint()
  local l_1_0 = 0
  local l_1_1 = bm.get_current_process_startup_info()
  local l_1_2 = mp.GetParentProcInfo(l_1_1.ppid)
  if l_1_2 ~= nil then
    l_1_0 = GetTechniquesCountForPid(l_1_2.ppid)
    if 4 < l_1_0 then
      TrackPidAndTechniqueBM(l_1_2.ppid, "T1083", "Discovery_FileAndDirectoryDiscovery")
      addRelatedProcess()
      reportRelatedBmHits()
      return true
    end
  end
  return false
end

if l_0_0 ~= nil then
  if string.find(l_0_0, "-perm", 1, true) and (string.match(l_0_0, "(%s)[-/](0*)200[07]") or string.match(l_0_0, "(%s)-(0*)400[07]") or string.match(l_0_0, "(%s)-(0*)6000") or string.match(l_0_0, "(%s)-(0*)222") or string.match(l_0_0, "(%s)-(0*)0002") or string.find(l_0_0, "u=s", 1, true) or string.find(l_0_0, "g=s", 1, true) or string.find(l_0_0, "-o w", 1, true) or string.find(l_0_0, "-o x", 1, true)) then
    if checkTaint() == true then
      return mp.INFECTED
    end
  elseif string.find(l_0_0, " -writable ", 1, true) and (string.match(l_0_0, "(%s)-type%s+[fd]") or string.find(l_0_0, "-not -user", 1, true)) and checkTaint() then
    return mp.INFECTED
  end
end
return mp.CLEAN
