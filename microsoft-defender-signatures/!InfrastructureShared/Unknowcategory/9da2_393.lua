-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9da2_393.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and (mp.getfilesize)() > 1800000 and (mp.getfilesize)() < 4800000 then
  local l_0_0 = (mp.GetCertificateInfo)()
  for l_0_4,l_0_5 in pairs(l_0_0) do
    if l_0_5.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
do
  l_0_0 = pe
  l_0_0 = l_0_0.get_versioninfo
  l_0_0 = l_0_0()
  if l_0_0 ~= nil then
    return mp.CLEAN
  end
  return mp.INFECTED
end

