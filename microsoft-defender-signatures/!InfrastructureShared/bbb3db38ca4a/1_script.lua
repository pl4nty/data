-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bbb3db38ca4a\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2 = nil
  else
  end
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
    local l_0_3 = (this_sigattrlog[3]).utf8p2
    if l_0_3 == "THREAT" then
      local l_0_4 = true
      if (MpCommon.PathToWin32Path)((bm.get_imagepath)()) == nil then
        return mp.CLEAN
      end
      if (sysio.IsPathAVExcluded)((MpCommon.PathToWin32Path)((bm.get_imagepath)()), false) == true then
        (bm.add_related_string)("isBMConcrete", tostring(l_0_4), bm.RelatedStringBMReport)
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

