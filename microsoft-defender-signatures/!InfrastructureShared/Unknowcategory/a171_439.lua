-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a171_439.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and (mp.getfilesize)() > 950000 and (mp.getfilesize)() < 1100000 then
  local l_0_0 = (mp.GetCertificateInfo)()
  for l_0_4,l_0_5 in pairs(l_0_0) do
    if l_0_5.Signers ~= nil then
      return mp.CLEAN
    end
  end
  local l_0_6 = (pe.get_versioninfo)()
  if l_0_6 ~= nil and l_0_6.OriginalFilename == "HH.exe" then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

