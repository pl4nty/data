-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a2e0_496.luac 

-- params : ...
-- function num : 0
do
  if (peattributes.isexe ~= true or ((pesecs[1]).Name ~= "UPX0" and (pesecs[1]).Name ~= ".text") or ((pesecs[2]).Name ~= "UPX1" and (pesecs[2]).Name ~= ".bss") or (mp.get_mpattribute)("pea_no_security")) then
    local l_0_0 = (mp.GetCertificateInfo)()
    for l_0_4,l_0_5 in pairs(l_0_0) do
      if l_0_5.Signers ~= nil then
        return mp.CLEAN
      end
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end

