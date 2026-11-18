-- Threat: !InfrastructureShared
-- Name: 9eb38ab5acb1
-- Type: 21
-- Includes: TechniqueTracker

if IsLegacyOrgMachine() or IsTechniqueObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion_cln") then
  return mp.CLEAN
end
local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  local l_0_4 = l_0_3.image_path
  if l_0_4 ~= nil then
    local l_0_5 = {
      ["ccmexec.exe"] = true,
      ["gpscript.exe"] = true,
      ["mpcmdrun.exe"] = true,
      ["mssense.exe"] = true,
      ["senseir.exe"] = true
    }
    local l_0_6 = string.lower(l_0_4:match("\\([^\\]+)$"))
    if l_0_5[l_0_6] then
      return mp.CLEAN
    end
  end
end
if bm.GetSignatureMatchDuration() > 36000000000 then
  return mp.CLEAN
end
if IsDetectionThresholdMet("BM") then
  return mp.INFECTED
end
return mp.CLEAN
