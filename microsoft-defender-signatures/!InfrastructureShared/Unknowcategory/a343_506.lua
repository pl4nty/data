-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a343_506.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetCertificateInfo)()
for l_0_4,l_0_5 in pairs(l_0_0) do
  if l_0_5.Signers ~= nil and (mp.get_mpattribute)("HSTR:ollama!MTB") and peattributes.x86_image and not (mp.get_mpattribute)("do_exhaustivehstr_rescan") then
    (mp.set_mpattribute)("do_exhaustivehstr_rescan")
  end
  if peattributes.amd64_image and not (mp.get_mpattribute)("do_exhaustivehstr_64bit_rescan") then
    (mp.set_mpattribute)("do_exhaustivehstr_64bit_rescan")
  end
end
return mp.INFECTED

