-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a3a0_527.luac 

-- params : ...
-- function num : 0
if peattributes.is_process then
  return mp.CLEAN
end
if (mp.get_mpattribute)("pea_epscn_writable") and (mp.get_mpattribute)("pea_lastscn_executable") and (mp.get_mpattribute)("pea_firstsectwritable") and (mp.get_mpattribute)("pea_epinfirstsect") and (mp.get_mpattribute)("pea_isexe") and (mp.get_mpattribute)("pea_entrybyte60") and (mp.get_mpattribute)("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN

