-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a136_luac 

-- params : ...
-- function num : 0
do
  if epcode[1] == 233 and epcode[2] == 90 and epcode[3] == 94 and epcode[11] == 233 and peattributes.isexe == true and peattributes.amd64_image then
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

