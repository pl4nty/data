-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a216_453.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetHSTRCallerId)()
if l_0_0 ~= nil and mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
do
  if peattributes.isexe == true and peattributes.ismsil == true and (mp.get_mpattribute)("pea_no_security") then
    local l_0_1 = (mp.GetCertificateInfo)()
    for l_0_5,l_0_6 in pairs(l_0_1) do
      if l_0_6.Signers ~= nil then
        return mp.CLEAN
      end
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end

