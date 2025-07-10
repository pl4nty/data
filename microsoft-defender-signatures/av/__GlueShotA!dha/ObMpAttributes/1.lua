-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\__GlueShotA!dha\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (pe.get_versioninfo)()
if l_0_0 ~= nil then
  if l_0_0.OriginalFilename == nil or (l_0_0.OriginalFilename):find("sumburv", 1, true) == nil then
    return mp.CLEAN
  end
  if l_0_0.CompanyName == nil or l_0_0.CompanyName ~= "ESET North America" then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN

