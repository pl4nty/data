-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a246_463.luac 

-- params : ...
-- function num : 0
if not peattributes.isexe and not peattributes.isdll then
  return mp.CLEAN
end
if (mp.getfilesize)() > 5000000 then
  return mp.CLEAN
end
local l_0_0 = (mp.GetCertificateInfo)()
for l_0_4,l_0_5 in pairs(l_0_0) do
  if l_0_5.Signers ~= nil then
    return mp.CLEAN
  end
end
local l_0_6 = pe.query_import
if l_0_6(pe.IMPORT_STATIC, 933026593) == 0 then
  return mp.CLEAN
end
return mp.INFECTED

