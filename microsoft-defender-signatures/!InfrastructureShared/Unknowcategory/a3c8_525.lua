-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a3c8_525.luac 

-- params : ...
-- function num : 0
do
  if peattributes.isexe == true then
    local l_0_0 = (mp.GetCertificateInfo)()
    for l_0_4,l_0_5 in pairs(l_0_0) do
      if l_0_5.Signers ~= nil then
        return mp.CLEAN
      end
    end
    if peattributes.x86_image and not (mp.get_mpattribute)("do_exhaustivehstr_rescan") then
      (mp.set_mpattribute)("do_exhaustivehstr_rescan")
    end
    if peattributes.amd64_image and not (mp.get_mpattribute)("do_exhaustivehstr_64bit_rescan") then
      (mp.set_mpattribute)("do_exhaustivehstr_64bit_rescan")
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end

