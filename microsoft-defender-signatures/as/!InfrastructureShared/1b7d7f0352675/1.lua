-- Threat: !InfrastructureShared
-- Name: 1b7d7f0352675
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
local l_0_2, l_0_3 = pcall(mp.GetParentProcInfo)
if l_0_2 and l_0_3 ~= nil then
  l_0_0 = l_0_3.ppid
  l_0_1 = l_0_3.image_path
end
local l_0_4 = string.lower(l_0_1:match("([^\\]+)$"))
local l_0_5 = {
  ["ccmexec.exe"] = true,
  ["gpscript.exe"] = true,
  ["mpcmdrun.exe"] = true,
  ["mssense.exe"] = true,
  ["senseir.exe"] = true
}
if l_0_5[l_0_4] then
  return mp.CLEAN
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  if l_0_1:find("fsprocsvc", 1, true) then
    return mp.CLEAN
  end
  if IsPidExcluded(l_0_0) then
    return mp.CLEAN
  end
  if IsTechniqueObservedForPid(l_0_0, "T1036") then
    TrackPidAndTechnique(l_0_0, "T1036", "child_of_masq")
    return mp.INFECTED
  end
end
return mp.CLEAN
