-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaContextOleFileHasCertificateA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = false
local l_0_1 = (mp.GetCertificateInfo)()
for l_0_5,l_0_6 in pairs(l_0_1) do
  if l_0_6.Signers ~= nil then
    l_0_0 = true
    break
  end
end
do
  if l_0_0 == true then
    (mp.set_mpattribute)("Lua:OleFileHasCertificate")
  else
    if l_0_0 == false then
      (mp.set_mpattribute)("Lua:OleFileHasNoCertificate")
    end
  end
  return mp.CLEAN
end

