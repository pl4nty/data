-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d778d15a3\0x0000be8a_luac 

-- params : ...
-- function num : 0
do
  if mp.HSTR_WEIGHT >= 7 and (mp.get_mpattribute)("pea_ismsil") and (mp.get_mpattribute)("pea_no_security") and (mp.get_mpattribute)("pea_isexe") then
    local l_0_0 = (pe.get_versioninfo)()
    if l_0_0 == nil or l_0_0.ProductName == nil or l_0_0.InternalName == nil or l_0_0.CompanyName == nil or l_0_0.OriginalFilename == nil then
      return mp.INFECTED
    end
    if (string.find)(l_0_0.InternalName, "PvLogic", 1, true) == nil then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

