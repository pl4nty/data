-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9cfc_375.luac 

-- params : ...
-- function num : 0
do
  if peattributes.isexe == true and (mp.getfilesize)() >= 5000000 and peattributes.x86_image == true then
    local l_0_0 = (mp.GetCertificateInfo)()
    for l_0_4,l_0_5 in pairs(l_0_0) do
      if l_0_5.Signers ~= nil and (l_0_5.Signers).IsValid == true then
        return mp.CLEAN
      end
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end

