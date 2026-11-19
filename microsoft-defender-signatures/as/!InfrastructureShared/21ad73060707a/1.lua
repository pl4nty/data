-- Threat: !InfrastructureShared
-- Name: 21ad73060707a
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = getOrgIdScrubbed()
if l_0_0 ~= nil and (l_0_0 == "PII_c475ba7b0a466d24d1eaa5283dec456f150a341f" or l_0_0 == "PII_20ee2910cfb5158311549d8df218145fafa8183b") then
  return mp.LOWFI
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 ~= nil then
  local l_0_2 = string.lower(l_0_1.image_path)
  local l_0_3 = l_0_2:match("([^\\]+)$")
  local l_0_4 = {
    ["winword.exe"] = true,
    ["excel.exe"] = true,
    ["powerpnt.exe"] = true
  }
  if l_0_4[l_0_3] then
    return mp.INFECTED
  end
end
return mp.CLEAN
