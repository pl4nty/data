-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a0ef_419.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("RPF:TopLevelFile") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("CMN:HSTR:InstallerFile") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("pea_ismsil") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("pea_isdriver") then
  return mp.CLEAN
end
return mp.INFECTED

