-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\21ad73060707a\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = getOrgIdScrubbed()
if l_0_0 ~= nil and l_0_0 == "PII_c475ba7b0a466d24d1eaa5283dec456f150a341f" then
  return mp.LOWFI
end
local l_0_1 = (mp.GetParentProcInfo)()
if l_0_1 ~= nil then
  local l_0_2 = (string.lower)(l_0_1.image_path)
  local l_0_3 = l_0_2:match("([^\\]+)$")
  local l_0_4 = {}
  l_0_4["winword.exe"] = true
  l_0_4["excel.exe"] = true
  l_0_4["powerpnt.exe"] = true
  if l_0_4[l_0_3] then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

