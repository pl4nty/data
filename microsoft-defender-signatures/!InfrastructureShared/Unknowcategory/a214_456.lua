-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a214_456.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and (mp.getfilesize)() > 6000000 and (mp.getfilesize)() < 6300000 then
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
  local l_0_6 = nil
  if l_0_0 == nil then
    l_0_6 = mp
    l_0_6 = l_0_6.CLEAN
    return l_0_6
  end
  l_0_6 = l_0_0.OriginalFilename
  if l_0_6 ~= "ladddad.exe" then
    l_0_6 = mp
    l_0_6 = l_0_6.CLEAN
    return l_0_6
  end
  l_0_6 = mp
  l_0_6 = l_0_6.INFECTED
  return l_0_6
end

