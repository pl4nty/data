-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9b2c_366.luac 

-- params : ...
-- function num : 0
if peattributes.isdll == true and (mp.getfilesize)() > 190000 and (mp.getfilesize)() < 200000 and peattributes.hasexports == false then
  local l_0_0 = (mp.GetCertificateInfo)()
  for l_0_4,l_0_5 in pairs(l_0_0) do
    if l_0_5.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
do
  l_0_0 = mp
  l_0_0 = l_0_0.INFECTED
  return l_0_0
end

