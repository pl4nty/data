-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8743_304.luac 

-- params : ...
-- function num : 0
do
  if peattributes.isdll == true or peattributes.isexe == true then
    local l_0_0 = (mp.GetCertificateInfo)()
    if l_0_0 ~= nil and #l_0_0 > 0 and (mp.IsTrustedFile)() then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end

