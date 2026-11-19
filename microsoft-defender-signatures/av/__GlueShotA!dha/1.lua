-- Threat: \xafGlueShot.A!dha
-- Type: 8
-- MpAttributes: pea_ismsil

local l_0_0 = pe.get_versioninfo()
if l_0_0 ~= nil then
  if l_0_0.OriginalFilename == nil or l_0_0.OriginalFilename:find("sumburv", 1, true) == nil then
    return mp.CLEAN
  end
  if l_0_0.CompanyName == nil or l_0_0.CompanyName ~= "ESET North America" then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
