-- Threat: !InfrastructureShared
-- Name: 23d781c2bf2b
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
local l_0_2, l_0_3 = pcall(mp.GetParentProcInfo)
if l_0_2 and l_0_3 ~= nil then
  l_0_0 = l_0_3.ppid
  l_0_1 = l_0_3.image_path
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  local l_0_4 = l_0_1:match("([^\\]+)$")
  local l_0_5 = {
    ["winlogon.exe"] = true,
    ["explorer.exe"] = true,
    ["sihost.exe"] = true
  }
  if l_0_5[l_0_4] then
    return mp.CLEAN
  end
  if IsPidExcluded(l_0_0) then
    return mp.CLEAN
  end
  if IsTacticObservedForPid(l_0_0, "webshell_parent") or IsTacticObservedForPid(l_0_0, "webshell_childproc") then
    return mp.INFECTED
  end
  TrackPidAndTechnique(l_0_0, "T1218.011", "lolbin_rundll")
end
return mp.LOWFI
