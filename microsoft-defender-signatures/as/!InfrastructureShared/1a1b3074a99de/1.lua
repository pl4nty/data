-- Threat: !InfrastructureShared
-- Name: 1a1b3074a99de
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and string.len(l_0_0) >= 15 then
  local l_0_1 = {
    ["msmpeng.exe"] = true,
    ["mpcmd.exe"] = true,
    ["mpcmdrun.exe"] = true,
    ["resetengine.exe"] = true,
    ["svchost.exe"] = true,
    ["wuauclt.exe"] = true,
    ["dismhost.exe"] = true
  }
  local l_0_2 = string.lower(string.sub(l_0_0, -15)):match("\\([^\\]+)$")
  if l_0_1[l_0_2] then
    return mp.CLEAN
  end
end
TrackPidAndTechniqueBM("BM", "T1562.001", "mptamper_cipolicy")
return mp.INFECTED
