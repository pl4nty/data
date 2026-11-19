-- Threat: !InfrastructureShared
-- Name: a7d73a99601c
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
local l_0_2, l_0_3 = pcall(mp.GetParentProcInfo)
if l_0_2 and l_0_3 ~= nil then
  l_0_0 = l_0_3.ppid
  l_0_1 = string.lower(l_0_3.image_path)
  if l_0_0 ~= nil then
    if IsPidExcluded(l_0_0) then
      return mp.CLEAN
    end
    if l_0_1:find("ltsvc.exe") then
      return mp.CLEAN
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
    TrackPidAndTechnique(l_0_0, "T1071.001", "lolbin_web_github")
    if IsDetectionThresholdMet(l_0_0) then
      return mp.INFECTED
    end
    return mp.LOWFI
  end
end
return mp.CLEAN
