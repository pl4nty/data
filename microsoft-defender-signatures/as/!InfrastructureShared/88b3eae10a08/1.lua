-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\88b3eae10a08\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[3]).matched then
  return mp.CLEAN
end
if (this_sigattrlog[3]).utf8p2 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[3]).utf8p2)
if (string.len)(l_0_0) < 10 then
  return mp.CLEAN
end
do
  if (contains(l_0_0, "sekurlsa") and not contains(l_0_0, "mimikatz")) or contains(l_0_0, "lsass") then
    local l_0_1 = 0 + 5 + 5 + 3
  end
  local l_0_2 = nil
  local l_0_3 = containsall
  local l_0_4 = l_0_0
  l_0_3 = l_0_3(l_0_4, {"reg query", "\\sam"})
  if l_0_3 then
    l_0_2 = l_0_2 + 4
  end
  l_0_3 = containsall
  l_0_4 = l_0_0
  l_0_3 = l_0_3(l_0_4, {"procdump", "lsass"})
  if l_0_3 then
    l_0_2 = l_0_2 + 5
  end
  l_0_3 = containsall
  l_0_4 = l_0_0
  l_0_3 = l_0_3(l_0_4, {"schtasks", "/create"})
  if l_0_3 then
    l_0_2 = l_0_2 + 3
  end
  l_0_3 = containsall
  l_0_4 = l_0_0
  l_0_3 = l_0_3(l_0_4, {"reg add", "\\run"})
  if l_0_3 then
    l_0_2 = l_0_2 + 3
  end
  l_0_3 = contains
  l_0_4 = l_0_0
  l_0_3 = l_0_3(l_0_4, "sc create")
  if l_0_3 then
    l_0_2 = l_0_2 + 3
  end
  l_0_3 = containsall
  l_0_4 = l_0_0
  l_0_3 = l_0_3(l_0_4, {"startup", "copy"})
  if l_0_3 then
    l_0_2 = l_0_2 + 2
  end
  l_0_3 = contains
  l_0_4 = l_0_0
  l_0_3 = l_0_3(l_0_4, "-encodedcommand")
  if l_0_3 then
    l_0_2 = l_0_2 + 3
  end
  l_0_3 = containsall
  l_0_4 = l_0_0
  l_0_3 = l_0_3(l_0_4, {"set-mppreference", "-disablerealtimemonitoring"})
  if l_0_3 then
    l_0_2 = l_0_2 + 5
  end
  l_0_3 = containsall
  l_0_4 = l_0_0
  l_0_3 = l_0_3(l_0_4, {"add-mppreference", "-exclusionpath"})
  if l_0_3 then
    l_0_2 = l_0_2 + 4
  end
  l_0_3 = containsall
  l_0_4 = l_0_0
  l_0_3 = l_0_3(l_0_4, {"wevtutil", "cl "})
  if l_0_3 then
    l_0_2 = l_0_2 + 3
  end
  if l_0_2 < 3 then
    l_0_3 = mp
    l_0_3 = l_0_3.CLEAN
    return l_0_3
  end
  l_0_3 = TrackPidAndTechniqueBM
  l_0_4 = "BM"
  l_0_3(l_0_4, "T1059", "Execution")
  l_0_3 = add_parents
  l_0_3()
  l_0_3 = mp
  l_0_3 = l_0_3.INFECTED
  return l_0_3
end

